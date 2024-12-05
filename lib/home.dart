import 'package:flutter/material.dart';
import 'package:latres_124220028/ListPage.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _username;

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username');
    });
  }

  void _navigateTo(String menu) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ListPage(menu: menu),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hai, ${_username ?? 'Username'}!'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildMenuCard(
              icon: Icons.newspaper,
              title: "News",
              description:
                  "Get an overview of the latest SpaceFlight news from various sources.",
              onTap: () => _navigateTo('News'),
            ),
            _buildMenuCard(
              icon: Icons.article,
              title: "Blog",
              description:
                  "Blogs often provide a detailed overview of launches and missions.",
              onTap: () => _navigateTo('Blog'),
            ),
            _buildMenuCard(
              icon: Icons.report,
              title: "Report",
              description:
                  "Space stations and other missions often publish their data.",
              onTap: () => _navigateTo('Report'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard({
    required IconData icon,
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      child: ListTile(
        leading: Icon(icon, size: 40, color: Colors.deepPurple),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        onTap: onTap,
      ),
    );
  }
}
 