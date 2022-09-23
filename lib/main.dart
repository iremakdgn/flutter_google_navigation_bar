import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

void main() => runApp(MaterialApp(
    title: 'GNav',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.grey[800],
    ),
    home: HomePage()));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = <Widget>[
      Container(
        color: Colors.purple,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Text(
            'Home',
            style: optionStyle,
          ),
        ),
      ),
      Container(
        color: Colors.yellow,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Text(
            'Likes',
            style: optionStyle,
          ),
        ),
      ),
      Container(
        color: Colors.red,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Text(
            'Search',
            style: optionStyle,
          ),
        ),
      ),
      Container(
        color: Colors.green,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Text(
            'Profile',
            style: optionStyle,
          ),
        ),
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 20,
        title: const Text('GoogleNavBar'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 8,
            curve: Curves.easeOutExpo,
            activeColor: Colors.black,
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: Duration(milliseconds: 400),
            tabBackgroundColor: Colors.grey[100]!,
            color: Colors.black,
            tabs: [
              GButton(
                backgroundColor: Colors.purple[100],
                iconActiveColor: Colors.purple,
                icon: LineIcons.home,
                text: 'Home',
                textColor: Colors.purple,
              ),
              GButton(
                backgroundColor: Colors.yellow[100],
                iconActiveColor: Colors.yellow,
                icon: LineIcons.heart,
                text: 'Likes',
                textColor: Colors.yellow,
              ),
              GButton(
                backgroundColor: Colors.red[100],
                iconActiveColor: Colors.red,
                textColor: Colors.red,
                icon: LineIcons.search,
                text: 'Search',
              ),
              GButton(
                backgroundColor: Colors.green[100],
                iconActiveColor: Colors.green,
                textColor: Colors.green,
                icon: LineIcons.user,
                text: 'Profile',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
