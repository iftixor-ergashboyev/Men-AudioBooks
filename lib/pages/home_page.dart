import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:men/pages/audios_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: CupertinoColors.white,
        title: const Text("Assalomu alaykum!", style: TextStyle(
          fontFamily: "MyFont", fontSize: 22, fontWeight: FontWeight.bold, color: CupertinoColors.black
        )),
      ),
      backgroundColor: CupertinoColors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Kategoriya:", textAlign: TextAlign.start, style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 16, fontFamily: "MyFont"
            )),
            const Gap(10),
            ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                  child: Image.asset("assets/images/men_2.png")),
              title: const Text("Men - Bas qil, ey nafs!", style: TextStyle(
                 color: CupertinoColors.black, fontSize: 17, fontFamily: "MyFont"
              )),
              trailing: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => const AudiosPage())
                  );
                },
                child: Container(
                  height: 30,
                  width: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xff77e16e),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: const Center(
                    child: Text("OCHISH", style: TextStyle(
                      fontFamily: "MyFont", color: CupertinoColors.white, fontWeight: FontWeight.bold
                    )),
                  ),
                ),
              ),
            ),
            const Divider(),
           const  Gap(10),
            const Text("Tafsiya:", textAlign: TextAlign.start, style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 16, fontFamily: "MyFont"
            )),
            const Gap(10),
            ListTile(
              leading: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset("assets/images/aso.jpg", fit: BoxFit.cover, width: 50,)),
              title: const Text("Aso - Inson unutilganda o'ladi!", style: TextStyle(
                  color: CupertinoColors.black, fontSize: 17, fontFamily: "MyFont"
              )),
              trailing: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  _logout();
                },
                child: Container(
                  height: 30,
                  width: 60,
                  decoration: BoxDecoration(
                      color: const Color(0xffb64168),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: const Center(
                    child: Text("INSTALL", style: TextStyle(
                        fontFamily: "MyFont", color: CupertinoColors.white, fontWeight: FontWeight.bold
                    )),
                  ),
                ),
              ),
            ),
            const Gap(10),
            ListTile(
              leading: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset("assets/images/pir.jpg", fit: BoxFit.cover, width: 50,)),
              title: const Text("Pir - Piri Turkiston Ahmad Yassaviy qissasi!", style: TextStyle(
                  color: CupertinoColors.black, fontSize: 17, fontFamily: "MyFont"
              )),
              trailing: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  _logout();
                },
                child: Container(
                  height: 30,
                  width: 60,
                  decoration: BoxDecoration(
                      color: const Color(0xffd79749),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: const Center(
                    child: Text("INSTALL", style: TextStyle(
                        fontFamily: "MyFont", color: CupertinoColors.white, fontWeight: FontWeight.bold
                    )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  _logout() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text("Install", style: GoogleFonts.montserrat(),),
          content: Text("Google Play ochilsinmi?", style: GoogleFonts.montserrat(),),
          actions: <CupertinoDialogAction>[
            CupertinoDialogAction(
              child: Text("Yo'q", style: GoogleFonts.montserrat(color: Colors.red),),
              isDefaultAction: true,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            CupertinoDialogAction(
              child: Text("Ha", style: GoogleFonts.montserrat(),),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
