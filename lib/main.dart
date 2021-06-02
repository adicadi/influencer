import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'feed.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Influencer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: HexColor('4661df'),
      ),
      home: MyHomePage(title: 'Influencer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String avatar =
      'https://images.fastcompany.net/image/upload/w_596,c_limit,q_auto:best,f_auto/wp-cms/uploads/2018/10/i-2-lighting.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.menu),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 70, 0),
                    child: Text(widget.title),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(80, 0, 20, 0),
                    child: Container(
                      child: Stack(
                        children: [
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white)),
                            child: CircleAvatar(
                              radius: 20,
                              backgroundImage: NetworkImage(avatar),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 34, left: 1),
                            child: Container(
                              width: 42,
                              child: Card(
                                color: Colors.pink[300],
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 2, vertical: 1),
                                  child: Text(
                                    'Live',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    child: Image.asset('assets/dm.png'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Feed(avatar: avatar),
        ),
      ),
      extendBody: true,
      bottomNavigationBar: FloatingNavbar(
        backgroundColor: HexColor('4661df'),
        selectedBackgroundColor: HexColor('4661df'),
        selectedItemColor: Colors.white,
        itemBorderRadius: 50,
        borderRadius: 50,
        onTap: (int val) {},
        currentIndex: 0,
        items: [
          FloatingNavbarItem(icon: Icons.home_outlined, title: 'Home'),
          FloatingNavbarItem(icon: Icons.videocam_outlined, title: 'New'),
          FloatingNavbarItem(
              icon: Icons.photo_size_select_actual_outlined, title: 'Gallery'),
          FloatingNavbarItem(icon: Icons.person_outlined, title: 'Lisa'),
        ],
      ),
    );
  }
}
