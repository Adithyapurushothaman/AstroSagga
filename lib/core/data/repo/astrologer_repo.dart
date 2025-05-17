import 'package:flutter_application_1/core/data/model/astrologer.dart';

class AstrologerRepository {
  // Mock data - in a real app, you would fetch this from an API
  final List<Astrologer> _astrologers = [
    Astrologer(
      id: '1',
      name: 'Rakesh Kaushik',
      expertise: 'Vedic',
      experience: '10',
      rating: 4.2,
      price: 10,
      followers: 10000,
      isOnline: true,
      about:
          'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
      skills: [
        'Tarot Reading',
        'Vedic Astrology',
        'Numerology',
        'Face Reading'
      ],
      languages: ['Kannada', 'Telugu', 'Tamil', 'English', 'Hindi'],
    ),
    Astrologer(
      id: '2',
      name: 'Neha Sharma',
      expertise: 'Tarot',
      experience: '8',
      rating: 4.5,
      price: 12,
      followers: 8500,
      isOnline: false,
      about:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      skills: ['Tarot Reading', 'Numerology', 'Palmistry'],
      languages: ['Hindi', 'English', 'Punjabi'],
    ),
    Astrologer(
      id: '3',
      name: 'Amit Verma',
      expertise: 'Numerology',
      experience: '15',
      rating: 4.9,
      price: 15,
      followers: 12000,
      isOnline: true,
      about:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      skills: ['Tarot Reading', 'Numerology', 'Palmistry'],
      languages: ['Hindi', 'English', 'Punjabi'],
    ),
    Astrologer(
      id: '4',
      name: 'Priya Patel',
      expertise: 'Palmistry',
      experience: '7',
      rating: 4.3,
      price: 8,
      followers: 7000,
      isOnline: true,
      about:
          'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
      skills: [
        'Tarot Reading',
        'Vedic Astrology',
        'Numerology',
        'Face Reading'
      ],
      languages: ['Kannada', 'Telugu', 'Tamil', 'English', 'Hindi'],
    ),
    Astrologer(
      id: '5',
      name: 'Rajesh Kumar',
      expertise: 'Vastu',
      experience: '12',
      rating: 4.6,
      price: 14,
      followers: 9500,
      isOnline: false,
      about:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      skills: ['Tarot Reading', 'Numerology', 'Palmistry'],
      languages: ['Hindi', 'English', 'Punjabi'],
    ),
    Astrologer(
      id: '6',
      name: 'Sunita Agarwal',
      expertise: 'Astrology',
      experience: '9',
      rating: 4.4,
      price: 11,
      followers: 8200,
      isOnline: true,
      about:
          'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
      skills: [
        'Tarot Reading',
        'Vedic Astrology',
        'Numerology',
        'Face Reading'
      ],
      languages: ['Kannada', 'Telugu', 'Tamil', 'English', 'Hindi'],
    ),
  ];

  List<Astrologer> getAstrologers() {
    return _astrologers;
  }

  Astrologer? getAstrologerById(String id) {
    try {
      return _astrologers.firstWhere((astrologer) => astrologer.id == id);
    } catch (e) {
      return null;
    }
  }
}
