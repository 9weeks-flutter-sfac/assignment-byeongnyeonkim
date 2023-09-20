import 'package:flutter/material.dart';

import 'Musictile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.dark(),
      ),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          shape: Border(
            bottom: BorderSide(color: Colors.white, width: 0.1),
          ),
          leading: Icon(Icons.arrow_back_ios),
          title: Text('아워리스트'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.monitor),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            ),
          ],
        ),
        body: ListView(
          children: [
            Musictile(
              title: 'Come with me',
              artist: 'Surfaces 및 salem ilese',
              duration: '·3:00',
              albumImg: 'assets/music_come_with_me.png',
            ),
            Musictile(
              title: 'Good Day',
              artist: 'Surfaces',
              duration: '·3:00',
              albumImg: 'assets/music_good_day.png',
            ),
            Musictile(
              title: 'Honesty',
              artist: 'Pink Sweat\$',
              duration: '·3:00',
              albumImg: 'assets/music_honesty.png',
            ),
            Musictile(
              title: 'I Wish I Missed My Ex',
              artist: '마할리아 버크마',
              duration: '·3:00',
              albumImg: 'assets/music_i_wish_i_missed_my_ex.png',
            ),
            Musictile(
              title: 'Plastic Plants',
              artist: '마할리아 버크마',
              duration: '·3:00',
              albumImg: 'assets/music_plastic_plants.png',
            ),
            Musictile(
              title: 'Sucker for you',
              artist: '맷 테리',
              duration: '·3:00',
              albumImg: 'assets/music_sucker_for_you.png',
            ),
            Musictile(
              title: 'Summer is for falling in love',
              artist: 'Sarah Kang & Eye Love Brandon',
              duration: '·3:00',
              albumImg: 'assets/music_summer_is_for_falling_in_love.png',
            ),
            Musictile(
              title: 'These Day',
              artist:
                  '(feat. Jess Glynn Macklemore & Dan Caplen) - Rudimental)',
              duration: '·3:00',
              albumImg: 'assets/music_these_days.png',
            ),
            Musictile(
              title: 'You Make Me',
              artist: 'DAY6',
              duration: '·3:00',
              albumImg: 'assets/music_you_make_me.png',
            ),
            Musictile(
              title: 'Zombie Pop',
              artist: 'DRP IAN',
              duration: '·3:00',
              albumImg: 'assets/music_zombie_pop.png',
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 2,
          fixedColor: Colors.white,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
            BottomNavigationBarItem(icon: Icon(Icons.explore), label: '둘러보기'),
            BottomNavigationBarItem(
                icon: Icon(Icons.library_music), label: '보관함'),
          ],
        ),
        bottomSheet: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 64,
              color: Colors.white12,
              child: ListTile(
                leading: ClipRRect(
                  child: Image.asset('assets/music_you_make_me.png'),
                ),
                title: Text('You make Me'),
                subtitle: Text('DAY6'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.play_arrow),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.skip_next),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 1,
              alignment: Alignment.centerLeft,
              child: Container(
                width: 14,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
