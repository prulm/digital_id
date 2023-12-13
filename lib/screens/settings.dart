import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final List<Map> items = [
    {
      'title': 'Language',
      'subtitle': Text('Select your language'),
      'leading': Icon(Icons.language),
      'switch': false,
    },
    {
      'title': 'Dark Mode',
      'subtitle': Text('Enable dark mode'),
      'leading': Icon(Icons.dark_mode),
      'switch': true,
      'isOn': false,
    },
    {
      'title': 'Receive Push Notifications',
      'subtitle': Text('New crop data information'),
      'leading': null,
      'switch': true,
      'isOn': false,
    },
    {
      'title': 'Receive Other Notifications',
      'subtitle': Text('Answers to your questions'),
      'leading': null,
      'switch': true,
      'isOn': false,
    },
    {
      'title': 'Receive More Notifications',
      'subtitle': Text('Popular Posts'),
      'leading': null,
      'switch': true,
      'isOn': false,
    },
  ];

  void _getPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < items.length; i++) {
      if (items[i]['switch']) {
        items[i]['isOn'] = prefs.getBool(items[i]['title']);
      }
    }
    setState(() {});
  }

  @override
  void initState() {
    _getPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(items[index]['title']),
              subtitle: items[index]['subtitle'],
              leading: items[index]['leading'],
              trailing: items[index]['switch']
                  ? Switch(
                      value: items[index]['isOn'],
                      onChanged: (data) async {
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        await prefs.setBool(items[index]['title'], data);
                        setState(() {
                          items[index]['isOn'] = data;
                        });
                      },
                    )
                  : null,
            );
          }),
    );
  }
}
