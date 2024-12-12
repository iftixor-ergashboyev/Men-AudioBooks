import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/item.dart';
import 'detail_page.dart';

class AudiosPage extends StatefulWidget {
  const AudiosPage({super.key});

  @override
  State<AudiosPage> createState() => _AudiosPageState();
}

class _AudiosPageState extends State<AudiosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: Men_audio.length,
        itemBuilder: (context, index) {
          final book = Men_audio[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.asset("assets/icon/book_icon.png")),
              title: Text(book['name']!, style: const TextStyle(
                  fontSize: 20, fontFamily: "MyFont", color: CupertinoColors.black
              ),),
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => DetailPage(
                      name: book['name']!,
                      image: book['image']!,
                      audioPath: book['audio']!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
