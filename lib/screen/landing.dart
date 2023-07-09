import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: _scaffoldKey,
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.redAccent[700],
              ),
              child: const Text('About Me'),
            ),
            ListTile(
              title: const Text('Background Details'),
              onTap: () {
                // Update the state of the app.
                // Navigate to Item 1 when tapped
                // Then close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondRoute()),
                );
              },
            ),
            ListTile(
              title: const Text('Contact Me'),
              onTap: () {
                // Update the state of the app.
                // Navigate to Item 2 when tapped
                // Then close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ThirdRoute()),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                _scaffoldKey.currentState!.openEndDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ))
        ],
        backgroundColor: Colors.black,
        title: const Text(
          'MyPortFolio',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "asset/firas.jpeg",
              height: 300,
              width: 300,
            ),
            const Text('This is how this app developer looks like.')
          ],
        ),
      ),
    ));
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Background Details'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
                'Greetings, readers. This is my portfolio. My full name is Muhammad Firas bin Abdullah, but you can call me Firas or Radz. I am from Sungai Petani, Kedah. When I was in high school, I studied for 5 years in Maktab Mahmud Alor Setar, Kedah. Then i went to IKM Sik after a year of unemployment, thanks to Covid-19. ',
                textAlign: TextAlign.justify),
            Text(
                'My SPM grades are not doing good, with results of 4As, 5Bs, and 2Cs, I have limited of choice on where do my education next. Luckily, MARA gave me a chance to join into their family. So I take the chance to become part of IKM Sik family for 3 years, under the Diploma of Computer Technology (Security) course',
                textAlign: TextAlign.justify),
            Text(
                'Lets talk about my interest. Personally I am the on-the-bridge kind of person, between introvert and extrovert person. I am not a conversation starter irl, but I can make things interesting once the talk is on. I love playing games, watching animes, reading novels and comics, and streaming like netflix and chill.',
                textAlign: TextAlign.justify),
            Text(
                'Favourite Game: League of Legends, VALORANT, Wild Rift, Honkai Star Rail\nFavourite Anime: Fuuto PI, Violet Evergarden, Dusk Maiden X Amnesia',
                textAlign: TextAlign.justify),
          ],
        ),
      ),
    );
  }
}

class ThirdRoute extends StatelessWidget {
  const ThirdRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Me'),
      ),
      body: Center(
        child: Link(
          uri: Uri.parse('https://linktr.ee/fyi.radz'),
          builder: (context, FollowLink) => MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
                onTap: FollowLink,
                child: const Text(
                  'My Links',
                  style: TextStyle(
                    fontSize: 48,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
