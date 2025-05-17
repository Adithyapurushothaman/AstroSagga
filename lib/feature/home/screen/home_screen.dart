import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/provider.dart';
import 'package:flutter_application_1/feature/home/widget/banner_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../widget/expert_card.dart';
import '../widget/service_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get the list of astrologers from the provider
    final astrologers = ref.watch(astrologersProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 40,
              width: 40,
              fit: BoxFit.contain,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.black),
            onPressed: () {},
          ),
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFEEEEEE),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Row(
              children: [
                Text('100 ₹',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
                SizedBox(width: 2),
                Icon(Icons.account_balance_wallet_outlined,
                    size: 16, color: Colors.black),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Service categories
            Container(
              height: 150,
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  ServiceCard(
                    icon: Icons.favorite,
                    color: Colors.red,
                    title: 'Match Making',
                  ),
                  ServiceCard(
                    icon: Icons.star,
                    color: Colors.purple,
                    title: 'Subh Muhurat',
                  ),
                  ServiceCard(
                    icon: Icons.sunny,
                    color: Colors.orange,
                    title: 'Horoscope',
                  ),
                  ServiceCard(
                    icon: Icons.hexagon,
                    color: Colors.blue,
                    title: 'Kundali',
                  ),
                  ServiceCard(
                    icon: Icons.history,
                    color: Colors.pinkAccent,
                    title: 'Future',
                  ),
                  ServiceCard(
                    icon: Icons.money,
                    color: Colors.grey,
                    title: 'Lakshmi',
                  ),
                  ServiceCard(
                    icon: Icons.home,
                    color: Colors.teal,
                    title: 'Vastu',
                  ),
                ],
              ),
            ),

            // Banner
            Container(
              margin: const EdgeInsets.all(16),
              height: 100, // Increased from 80 to 90
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  BannerCard(
                    message: 'Explore your zodiac and cosmic insights here!',
                    name: 'Ritesh Kaushik',
                  ),
                  BannerCard(
                    message: 'Get daily horoscope updates!',
                    name: 'Priya Sharma',
                  ),
                  BannerCard(
                    message: 'Find your perfect match today!',
                    name: 'Amit Verma',
                  ),
                ],
              ),
            ),
            // Our Experts
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Our Experts',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.filter_list),
                    onPressed: () {
                      // You could trigger a filter dialog here
                    },
                  ),
                ],
              ),
            ),

            // Expert cards grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: astrologers.length,
              itemBuilder: (context, index) {
                final astrologer = astrologers[index];

                return ExpertCard(
                  astrologer: astrologer,
                  onTap: () {
                    // Set selected astrologer in Riverpod state
                    ref.read(selectedAstrologerIdProvider.notifier).state =
                        astrologer.id;

                    // Navigate to details screen with just the ID
                    try {
                      context.go('/astrologer/${astrologer.id}');
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Navigation error: $e")),
                      );
                    }
                  },
                );
              },
            ),
            // Add bottom padding for better scrolling
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
