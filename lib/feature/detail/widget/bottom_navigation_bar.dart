import 'package:flutter/material.dart';

class AstrologerBottomBar extends StatelessWidget {
  const AstrologerBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildContactButton(Icons.chat, '10₹/min', Colors.green),
          _buildContactButton(Icons.call, '10₹/min', Colors.green),
          _buildContactButton(Icons.video_call, '10₹/min', Colors.green),
        ],
      ),
    );
  }

  Widget _buildContactButton(IconData icon, String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 20),
          const SizedBox(width: 4),
          Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
