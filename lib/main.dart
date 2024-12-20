import 'package:flutter/material.dart';

void main() => runApp(const mHealthApp());

class mHealthApp extends StatelessWidget {
  const mHealthApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mHealth Demo',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const MainScreen(),
    );
  }
}
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 1; // Default to "Chat" tab

  // Updated list of screens
  final List<Widget> _screens = [
    const EmptyHomePage(), // Home tab (empty page)
    const ChatPage(), // Chat tab (main content)
    const ExerciseLibraryPage(),
    const ActivityStatsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.library_books), label: 'Exercise Library'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Activity Stats'),
        ],
      ),
    );
  }
}

class EmptyHomePage extends StatelessWidget {
  const EmptyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          '',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      ),
    );
  }
}


class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('mHealth'),
        centerTitle: true,
        actions: const [Icon(Icons.settings)],
        leading: const Icon(Icons.emoji_events),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage('assets/images/profile.png'), // Use the provided image
          ),
          const SizedBox(height: 20),
          const Text(
            'How can I help you today?',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const CreateWorkoutPage()));
                },
                style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 186, 154, 241)),
                child: const Text('Create Workout'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const ChatAdvicePage()));
                },
                style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 186, 154, 241)),
                child: const Text('Get Advice'),
              ),
            ],
          ),
          const SizedBox(height: 60), // Spacing before the text bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type a Message ...',
                prefixIcon: const Icon(Icons.mic, color: Colors.deepPurple),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatAdvicePage extends StatelessWidget {
  const ChatAdvicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('mHealth'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // Chat message section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    child: Card(
                      color: Color.fromARGB(255, 216, 207, 207),
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          'Hi there! Could you tell me a bit more about the advice you are looking for?',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // TextField for user input
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type a Message ...',
                prefixIcon: const Icon(Icons.mic, color: Colors.deepPurple),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}


class CreateWorkoutPage extends StatelessWidget {
  const CreateWorkoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('mHealth'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: const [Icon(Icons.settings)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Custom Exercise',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Create custom exercise plans with the built-in generative AI model based on your health information.',
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {},
              child: const Text(
                '+ Add Custom Workout Plan',
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
class ExerciseLibraryPage extends StatelessWidget {
  const ExerciseLibraryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Exercise Library Page'));
  }
}

class ActivityStatsPage extends StatelessWidget {
  const ActivityStatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Activity Stats Page'));
  }
}
