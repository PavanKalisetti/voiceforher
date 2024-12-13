import 'package:flutter/material.dart';
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage('https://example.com/avatar.jpg'),
          ),
          SizedBox(height: 16),
          Text(
            'John Doe',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            'johndoe@example.com',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          Divider(height: 32),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Address'),
            subtitle: Text('123 Main Street, Anytown, CA 12345'),
            onTap: () {
              // Handle address tap
            },
          ),
          ListTile(
            leading: Icon(Icons.school),
            title: Text('Education'),
            subtitle: Text('Bachelor of Science in Computer Science'),
            onTap: () {
              // Handle education tap
            },
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Mobile Number'),
            subtitle: Text('+123 456 7890'),
            onTap: () {
              // Handle mobile number tap
            },
          ),
        ],
      ),
    );
  }
}