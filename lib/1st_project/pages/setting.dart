import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDarkMode = false;
  double _fontSize = 14.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Dark Mode Switch
          SwitchListTile(
            title: Text('Dark Mode'),
            value: _isDarkMode,
            onChanged: (bool value) {
              setState(() {
                _isDarkMode = value;
              });
            },
          ),

          // Font Size Slider
          ListTile(
            title: Text('Font Size'),
            subtitle: Slider(
              value: _fontSize,
              min: 10.0,
              max: 30.0,
              divisions: 10,
              label: _fontSize.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _fontSize = value;
                });
              },
            ),
          ),

          // Notifications Switch
          SwitchListTile(
            title: Text('Enable Notifications'),
            value: _isDarkMode,  // Just as an example; this could be a different state variable
            onChanged: (bool value) {
              setState(() {
                // Update your state here
              });
            },
          ),

          // Other Settings
        ],
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Center(
        child: Text('About this app...'),
      ),
    );
  }
}
