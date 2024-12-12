import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class DetailPage extends StatefulWidget {
  final String name;
  final String image;
  final String audioPath;

  const DetailPage({
    required this.name,
    required this.image,
    required this.audioPath,
    Key? key,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late AudioPlayer _audioPlayer;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    _audioPlayer.durationStream.listen((duration) {
      setState(() {
        _duration = duration ?? Duration.zero;
      });
    });

    _audioPlayer.positionStream.listen((position) {
      setState(() {
        _position = position;
      });
    });

    _audioPlayer.playerStateStream.listen((playerState) {
      final playing = playerState.playing;
      final processingState = playerState.processingState;
      setState(() {
        isPlaying = playing &&
            (processingState != ProcessingState.completed &&
                processingState != ProcessingState.idle);
      });
    });

    _initializeAudio();
  }

  Future<void> _initializeAudio() async {
    try {
      await _audioPlayer.setAsset(widget.audioPath);
    } catch (e) {
      print('Error loading audio: $e');
    }
  }

  void _playPauseAudio() {
    if (isPlaying) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play();
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.white,
      appBar: AppBar(
          backgroundColor: CupertinoColors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(CupertinoIcons.back, color: Colors.green, size: 24),
          ),
          title: const Text("Ijro etilmoqda...", style: TextStyle(
              fontWeight: FontWeight.bold, color: CupertinoColors.black,fontSize: 22, fontFamily: "MyFont"
          ))),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Center(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(widget.image, height: 300, width: 300, fit: BoxFit.cover)),
            ),
            const SizedBox(height: 15),
            Text(
              widget.name, textAlign: TextAlign.start,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, fontFamily: "MyFont"),
            ),
            const SizedBox(height: 20),
            Slider(
              activeColor: Colors.green,
              thumbColor: Colors.green,
              inactiveColor: Colors.grey,
              value: _position.inSeconds.toDouble(),
              max: _duration.inSeconds.toDouble(),
              onChanged: (value) async {
                final position = Duration(seconds: value.toInt());
                await _audioPlayer.seek(position);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_formatDuration(_position), style: const TextStyle(fontFamily: "MyFont")),
                Text(_formatDuration(_duration), style: const TextStyle(fontFamily: "MyFont")),
              ],
            ),
            const SizedBox(height: 20),
            IconButton(
              iconSize: 70,
              icon: Icon(isPlaying ? CupertinoIcons.pause : CupertinoIcons.play, color: CupertinoColors.activeGreen,),
              onPressed: _playPauseAudio,
            ),
          ],
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }
}