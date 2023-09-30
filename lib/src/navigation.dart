import 'package:flutter/material.dart';
import 'package:weliveapp/src/pages/favorites/account_page.dart';
import 'package:weliveapp/src/pages/home/home_page.dart';
import 'package:weliveapp/src/widgets/privacy_policy.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  var selectedIndex = 0; // ← Add this property.

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final navigator = Navigator.of(context);
    var colorScheme = Theme.of(context).colorScheme;
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    Widget page;
    switch (selectedIndex) {
      case 0:
        page = HomePage();
        break;
      case 1:
        page = AccountPage();
        break;
      case 2:
        page = PrivacyPolicy();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    // The container for the current page, with its background color
    // and subtle switching animation.
    var mainArea = ColoredBox(
      color: colorScheme.surfaceVariant,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 200),
        child: page,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(
            'assets/images/we-logo.png',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Icon(Icons.settings),
              ],
            ),
          ),
          TextButton(
            onPressed: () => navigator.pushNamed('/'),
            child: Row(
              children: [
                Icon(Icons.logout),
              ],
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 450) {
            // Use a more mobile-friendly layout with BottomNavigationBar
            // on Mobile
            return Column(
              children: [
                Expanded(child: mainArea),
                SafeArea(
                  child: BottomNavigationBar(
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        label: 'Account',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.privacy_tip),
                        label: 'Privacy',
                      ),
                    ],
                    currentIndex: selectedIndex,
                    onTap: (value) {
                      setState(() {
                        selectedIndex = value;
                      });
                    },
                  ),
                )
              ],
            );
            // on Desktop
            // on Web
            // on Table
          } else {
            return Row(
              children: [
                SafeArea(
                  child: NavigationRail(
                    extended: constraints.maxWidth >= 600,
                    destinations: [
                      NavigationRailDestination(
                        icon: Icon(Icons.home),
                        label: Text('Home'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.person),
                        label: Text('Users'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.monitor),
                        label: Text('Monitor'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.assignment),
                        label: Text('Report'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.report_gmailerrorred),
                        label: Text('Account'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.privacy_tip),
                        label: Text('Privacy'),
                      ),
                    ],
                    selectedIndex: selectedIndex,
                    onDestinationSelected: (value) {
                      setState(() {
                        selectedIndex = value;
                      });
                    },
                  ),
                ),
                Expanded(child: mainArea),
              ],
            );
          }
        },
      ),
    );
  }
}
