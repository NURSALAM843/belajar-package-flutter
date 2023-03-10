import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avatar Glow"),
      ),
      body: Center(
        child: AvatarGlow(
          glowColor: Colors.teal,
          endRadius: 100.0,
          duration: Duration(milliseconds: 1000),
          child: Material(
            // Replace this child with your own
            elevation: 8.0,
            shape: CircleBorder(),
            child: CircleAvatar(
              backgroundColor: Colors.grey[100],
              backgroundImage: NetworkImage("https://i.ibb.co/PGv8ZzG/me.jpg"),
              radius: 50.0,
            ),
          ),
        ),
      ),
    );
  }
}
