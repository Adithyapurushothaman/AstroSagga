import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/feature/home/widget/custom_navigation_bar.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithBottomNavBar extends StatefulWidget {
  final Widget child;

  const ScaffoldWithBottomNavBar({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<ScaffoldWithBottomNavBar> createState() =>
      _ScaffoldWithBottomNavBarState();
}

class _ScaffoldWithBottomNavBarState extends State<ScaffoldWithBottomNavBar> {
  int _currentIndex = 0;

  // Define the tabs for bottom navigation
  static final List<String> _paths = [
    '/',
    '/chats',
    '/shop',
    '/profile',
  ];

  @override
  Widget build(BuildContext context) {
    // Update the current index based on current location
    final String location = GoRouterState.of(context).uri.path;
    for (int i = 0; i < _paths.length; i++) {
      if (location == _paths[i]) {
        _currentIndex = i;
        break;
      }
    }

    return Scaffold(
      body: widget.child,
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
          context.go(_paths[index]);
        },
      ),
    );
  }
}
