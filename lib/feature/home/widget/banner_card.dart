import 'package:flutter/material.dart';

class BannerCard extends StatelessWidget {
  final String message;
  final String name;
  final VoidCallback? onTap;

  const BannerCard({
    Key? key,
    required this.message,
    required this.name,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 100, // Fixed height for the card
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // Use minimum size needed
        children: [
          // Main message text - limit to one line if needed
          Expanded(
            child: Text(
              message,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          // Bottom row with avatar, name and like
          Row(
            children: [
              // Avatar
              CircleAvatar(
                radius: 12, // Reduced from 14
                backgroundColor: Colors.white,
                child: const Icon(Icons.person,
                    color: Colors.grey, size: 12), // Reduced size
              ),
              const SizedBox(width: 8),

              // Name
              Expanded(
                child: Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              // Like counter with eye icon - no need for Spacer anymore
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 6, vertical: 2), // Reduced padding
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(51),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.visibility_outlined,
                      color: Colors.white,
                      size: 12, // Reduced size
                    ),
                    const SizedBox(width: 2), // Reduced spacing
                    const Text(
                      '11k',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10, // Reduced font size
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
