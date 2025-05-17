import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/provider.dart';
import '../widget/bottom_navigation_bar.dart';

class AstrologerDetailScreen extends ConsumerWidget {
  final String id;

  const AstrologerDetailScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get astrologer data from Riverpod provider
    final astrologer = ref.watch(astrologerByIdProvider(id));

    // If astrologer is not found, show error
    if (astrologer == null) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.go('/'),
          ),
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Astrologer not found'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.go('/'),
        ),
        title: Row(
          children: [
            Text(astrologer.name, style: const TextStyle(color: Colors.white)),
            const SizedBox(width: 6),
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: astrologer.isOnline ? Colors.green : Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  // Astrologer Image (Rectangle)
                  Container(
                    width: 120,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  Text(
                    astrologer.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Rating, Experience and Followers
                  Container(
                    width: double.infinity,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.lightBlue[50],
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Rating with star icon
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.star,
                                color: Colors.amber, size: 14),
                            const SizedBox(width: 2),
                            Text(
                              '${astrologer.rating}',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            const Text(
                              ' Rating',
                              style: TextStyle(
                                fontSize: 13, // Slightly smaller text
                                fontWeight:
                                    FontWeight.w400, // Slightly thinner text
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(width: 8), // Reduced spacing

                        // Experience
                        Text(
                          '${astrologer.experience}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        const Text(
                          ' Experience',
                          style: TextStyle(
                            fontSize: 13, // Slightly smaller text
                            fontWeight:
                                FontWeight.w400, // Slightly thinner text
                            color: Colors.black,
                          ),
                        ),

                        const SizedBox(width: 8), // Reduced spacing

                        // Followers
                        Text(
                          '${(astrologer.followers / 1000).toStringAsFixed(0)}K', // Simplified to avoid decimal
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        const Text(
                          ' Followers',
                          style: TextStyle(
                            fontSize: 13, // Slightly smaller text
                            fontWeight:
                                FontWeight.w400, // Slightly thinner text
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Price per min info
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Call minutes
                        Row(
                          children: [
                            Icon(Icons.call, color: Colors.grey[700], size: 16),
                            const SizedBox(width: 4),
                            Text(
                              '${astrologer.price} mins',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[800],
                              ),
                            ),
                          ],
                        ),

                        // Divider
                        Container(
                          height: 20,
                          width: 1,
                          color: Colors.grey[300],
                        ),

                        // Chat minutes
                        Row(
                          children: [
                            Icon(Icons.chat_bubble_outline,
                                color: Colors.grey[700], size: 16),
                            const SizedBox(width: 4),
                            Text(
                              '22k mins',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[800],
                              ),
                            ),
                          ],
                        ),

                        // Space for button alignment
                        const SizedBox(width: 8),

                        // Follow button
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            minimumSize: const Size(80, 32),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 0),
                          ),
                          child: const Text(
                            'Follow',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Images section
            _buildSection(
              title: 'Images',
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 120,
                      height: 100,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                    );
                  },
                ),
              ),
            ),

            // Send Gifts section
            _buildSection(
              title: 'Send Gifts',
              child: SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildGiftItem('Photo', '₹7'),
                    _buildGiftItem('Heart', '₹12'),
                    _buildGiftItem('Rose Flower', '₹49'),
                    _buildGiftItem('Gem', '₹85'),
                  ],
                ),
              ),
            ),

            // Profile Summary
            _buildSection(
              title: 'Profile Summary',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    astrologer.about,
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Read More',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ],
              ),
            ),

            // Specialization
            _buildSection(
              title: 'Specialization',
              child: Text('Expert in ${astrologer.expertise}'),
            ),

            // Languages
            _buildSection(
              title: 'Languages',
              child: Text(astrologer.languages.join(', ')),
            ),

            // Chat with Assistant
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                        child:
                            const Icon(Icons.chat_bubble, color: Colors.white),
                      ),
                      const SizedBox(width: 16),
                      const Text(
                        'Chat With Assistant',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),
            ),

            // User Reviews
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Users Review (400 people)',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'View all',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 80), // Space for bottom navigation bar
          ],
        ),
      ),
      bottomNavigationBar: const AstrologerBottomBar(),
    );
  }

  Widget _buildSection({required String title, required Widget child}) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }

  Widget _buildGiftItem(String title, String price) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(fontSize: 12),
          ),
          Text(
            price,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}
