import 'package:flutter/material.dart';

void main() {
  runApp(const AutoTubeApp());
}

class AutoTubeApp extends StatelessWidget {
  const AutoTubeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AutoTube AI',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0B1020),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7357FF),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  final List<String> titles = [
    'Dashboard',
    'AI Studio',
    'Schedule',
    'Analytics',
    'Settings',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'AutoTube AI',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: selectedIndex == 0
            ? const DashboardPage()
            : OtherPage(title: titles[selectedIndex]),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() => selectedIndex = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.auto_awesome_outlined),
            label: 'AI Studio',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Schedule',
          ),
          NavigationDestination(
            icon: Icon(Icons.analytics_outlined),
            label: 'Analytics',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(18),
      children: [
        const Text(
          'Welcome to AutoTube AI 👋',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 7),
        Text(
          'Your AI-powered YouTube workspace',
          style: TextStyle(color: Colors.white.withOpacity(0.65)),
        ),
        const SizedBox(height: 22),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF6746E8), Color(0xFF30216F)],
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.auto_awesome, size: 32),
              SizedBox(height: 14),
              Text(
                'Create with AI',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 7),
              Text('Scripts, videos and SEO tools in one place.'),
              SizedBox(height: 15),
              Text(
                'AI STUDIO  →',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'Your Overview',
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 13),
        const Row(
          children: [
            Expanded(
              child: StatCard(
                icon: Icons.video_library_outlined,
                title: 'Videos',
                value: '0',
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: StatCard(
                icon: Icons.schedule,
                title: 'Scheduled',
                value: '0',
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        const Row(
          children: [
            Expanded(
              child: StatCard(
                icon: Icons.visibility_outlined,
                title: 'Views',
                value: '0',
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: StatCard(
                icon: Icons.people_outline,
                title: 'Subscribers',
                value: '0',
              ),
            ),
          ],
        ),
        const SizedBox(height: 25),
        const Text(
          'Automation Pipeline',
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 13),
        const PipelineItem(
          icon: Icons.edit_note,
          title: 'AI Script Generator',
          subtitle: 'Create video scripts',
        ),
        const PipelineItem(
          icon: Icons.movie_creation_outlined,
          title: 'AI Video Creator',
          subtitle: 'Generate video content',
        ),
        const PipelineItem(
          icon: Icons.search,
          title: 'YouTube SEO',
          subtitle: 'Titles, descriptions and tags',
        ),
        const PipelineItem(
          icon: Icons.upload_file,
          title: 'YouTube Upload',
          subtitle: 'Upload and schedule videos',
        ),
        const SizedBox(height: 18),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF172033),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Row(
            children: [
              Icon(Icons.info_outline, color: Colors.orange),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Prototype mode: AI services and YouTube connection are not active yet.',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class StatCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const StatCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF172033),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFF9D88FF)),
          const SizedBox(height: 12),
          Text(value, style: const TextStyle(
            fontSize: 23, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(title, style: const TextStyle(
            color: Colors.white60, fontSize: 12)),
        ],
      ),
    );
  }
}

class PipelineItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const PipelineItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF172033),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF9D88FF), size: 27),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(
                  fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(
                  color: Colors.white60, fontSize: 12)),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 15),
        ],
      ),
    );
  }
}

class OtherPage extends StatelessWidget {
  final String title;

  const OtherPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.construction, size: 55, color: Color(0xFF9D88FF)),
            const SizedBox(height: 18),
            Text(title, style: const TextStyle(
              fontSize: 23, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text(
              'This feature will be developed in the next stage.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
