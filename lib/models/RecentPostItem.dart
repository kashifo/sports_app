import 'package:flutter/material.dart';

class RecentPostItem extends StatelessWidget {
  final String profileImageUrl;
  final String name;
  final String description;

  const RecentPostItem({
    super.key,
    required this.profileImageUrl,
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, top: 1, bottom: 1),
      // padding: const EdgeInsets.all(2),
      child: Container(
        width: 200,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 0),
                blurRadius: 1,
                spreadRadius: 0,
                color: Colors.black.withOpacity(0.2))
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/user1.jpg'),
              radius: 15,
            ),
            const SizedBox(width: 8),
            Text(description, style: TextStyle(fontSize: 12),),
          ],
        ),
      ),
    );
  }
}