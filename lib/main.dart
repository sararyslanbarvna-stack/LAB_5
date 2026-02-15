import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 5 - Space',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.indigo[900]),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.indigo[900],
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Text(
            "Space Laboratory",
            style: TextStyle(color: Colors.white),
          ),
          bottom: const TabBar(
            indicatorColor: Colors.amber,
            tabs: [
              Tab(icon: Icon(Icons.list), text: "Planets"),
              Tab(icon: Icon(Icons.image), text: "Photos"),
              Tab(icon: Icon(Icons.color_lens), text: "Colors"),
              Tab(icon: Icon(Icons.card_giftcard), text: "Cards"),
              Tab(icon: Icon(Icons.notifications), text: "Toast"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // TAB 1: Planets List (Task 2)
            ListView(
              children: const [
                ListTile(
                  leading: CircleAvatar(child: Text('☿')),
                  title: Text('Mercury', style: TextStyle(color: Colors.white)),
                  subtitle: Text('Closest to the Sun', style: TextStyle(color: Colors.white70)),
                ),
                ListTile(
                  leading: CircleAvatar(child: Text('♀')),
                  title: Text('Venus', style: TextStyle(color: Colors.white)),
                  subtitle: Text('Hottest planet', style: TextStyle(color: Colors.white70)),
                ),
                ListTile(
                  leading: CircleAvatar(child: Text('🌍')),
                  title: Text('Earth', style: TextStyle(color: Colors.white)),
                  subtitle: Text('Our home', style: TextStyle(color: Colors.white70)),
                ),
                ListTile(
                  leading: CircleAvatar(child: Text('♂')),
                  title: Text('Mars', style: TextStyle(color: Colors.white)),
                  subtitle: Text('Red planet', style: TextStyle(color: Colors.white70)),
                ),
                ListTile(
                  leading: CircleAvatar(child: Text('♃')),
                  title: Text('Jupiter', style: TextStyle(color: Colors.white)),
                  subtitle: Text('Largest planet', style: TextStyle(color: Colors.white70)),
                ),
                ListTile(
                  leading: CircleAvatar(child: Text('♄')),
                  title: Text('Saturn', style: TextStyle(color: Colors.white)),
                  subtitle: Text('Has rings', style: TextStyle(color: Colors.white70)),
                ),
                ListTile(
                  leading: CircleAvatar(child: Text('♅')),
                  title: Text('Uranus', style: TextStyle(color: Colors.white)),
                  subtitle: Text('Ice giant', style: TextStyle(color: Colors.white70)),
                ),
                ListTile(
                  leading: CircleAvatar(child: Text('♆')),
                  title: Text('Neptune', style: TextStyle(color: Colors.white)),
                  subtitle: Text('Windy planet', style: TextStyle(color: Colors.white70)),
                ),
              ],
            ),
            
            // TAB 2: Planet Photos (Task 1)
            GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                List<String> images = [
                  'https://images.unsplash.com/photo-1614732414444-096e5f1122d5?w=200',
                  'https://images.unsplash.com/photo-1614313913007-2d4e2a2a3b0a?w=200',
                  'https://images.unsplash.com/photo-1614730321146-b6fa6a46bcb4?w=200',
                  'https://images.unsplash.com/photo-1614728894747-a83421e2b9c9?w=200',
                  'https://images.unsplash.com/photo-1614732484003-ef9881555dc3?w=200',
                  'https://images.unsplash.com/photo-1614732414444-096e5f1122d5?w=200',
                ];
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(images[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
            
            // TAB 3: Colored containers (Task 3)
            GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                List<Color> colors = [
                  Colors.red,
                  Colors.blue,
                  Colors.green,
                  Colors.orange,
                  Colors.purple,
                  Colors.teal,
                ];
                return Container(
                  color: colors[index],
                  child: Center(
                    child: Text(
                      '${index+1}',
                      style: const TextStyle(fontSize: 40, color: Colors.white),
                    ),
                  ),
                );
              },
            ),
            
            // TAB 4: Planet Cards (Task 4)
            ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: 3,
              itemBuilder: (context, index) {
                List<Map<String, dynamic>> cards = [
                  {
                    'color': Colors.red,
                    'title': '🔴 Mars',
                    'desc': 'Red planet',
                    'image': 'https://images.unsplash.com/photo-1614728894747-a83421e2b9c9?w=200',
                  },
                  {
                    'color': Colors.orange,
                    'title': '🪐 Saturn',
                    'desc': 'Planet with rings',
                    'image': 'https://images.unsplash.com/photo-1614732484003-ef9881555dc3?w=200',
                  },
                  {
                    'color': Colors.blue,
                    'title': '🌍 Earth',
                    'desc': 'Our home',
                    'image': 'https://images.unsplash.com/photo-1614730321146-b6fa6a46bcb4?w=200',
                  },
                ];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  color: cards[index]['color'],
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        width: double.infinity,
                        child: Image.network(
                          cards[index]['image'],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          children: [
                            Text(
                              cards[index]['title'],
                              style: const TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            Text(
                              cards[index]['desc'],
                              style: const TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            
            // TAB 5: Toast Button (Task 6)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '🚀 Press the button!',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Fluttertoast.showToast(
                        msg: 'Hello, Space! 🚀',
                        backgroundColor: Colors.deepPurple,
                        textColor: Colors.white,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    ),
                    child: const Text(
                      'Show Toast',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        
        // DRAWER (Task 5)
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                decoration: const BoxDecoration(color: Colors.deepPurple),
                accountName: const Text('Astronaut'),
                accountEmail: const Text('space@cosmos.com'),
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: NetworkImage('https://images.unsplash.com/photo-1614728894747-a83421e2b9c9?w=200'),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.rocket),
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Home selected')),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Profile'),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Profile selected')),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Settings selected')),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Logout')),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}