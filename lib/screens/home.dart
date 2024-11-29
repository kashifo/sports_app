import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../models/RecentPostItem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<BottomNavigationBarItem> navItems = [
    BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/icons/home.svg'),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/icons/search.svg'),
      label: 'Find',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/icons/football.svg'),
      label: 'My Football',
    ),
     BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/icons/chat.svg'),
      label: 'Chat',
    ),
     BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/icons/profile.svg'),
      label: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Football App'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle notification actions
            },
          ),
        ],
      ),
      drawer: const Drawer(
        // Add drawer content here
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search bar and post button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    // Handle post action
                  },
                ),
              ],
            ),
          ),

          // Recent Posts
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Recent Posts', style: TextStyle(fontWeight: FontWeight.bold,)),
          ),
          SizedBox(
            height: 40, // Adjust height as needed
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5, // Adjust item count
              itemBuilder: (context, index) {
                return RecentPostItem(profileImageUrl: '', name: 'name-$index', description: 'Suraj is looking for a team to join as Goalkeeper');
              },
            ),
          ),

        ],
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: _selectedIndex,
        items: navItems,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
