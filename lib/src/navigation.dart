import 'package:flutter/material.dart';
import 'package:weliveapp/src/pages/customer/customer_page.dart';
import 'package:weliveapp/src/pages/dashboard//dashboard_page.dart';
import 'package:weliveapp/src/pages/history/history_page.dart';
import 'package:weliveapp/src/pages/live/live_page.dart';
import 'package:weliveapp/src/pages/order/orders_page.dart';
import 'package:weliveapp/src/pages/problem/problem_page.dart';
import 'package:weliveapp/src/pages/report/report_page.dart';
import 'package:weliveapp/src/pages/store/store_page.dart';
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
        page = DashboardPage();
        break;
      case 1:
        page = LivePage();
        break;
      case 2:
        page = StorePage();
        break;
      case 3:
        page = OrdersPage();
        break;
      case 4:
        page = CustomerPage();
        break;
      case 5:
        page = ReportPage();
        break;
      case 6:
        page = HistoryPage();
        break;
      case 7:
        page = ProblemPage();
        break;
      case 8:
        page = PrivacyPolicy();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    // The container for the current page, with its Background Color
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
        leading: Padding(
          padding: const EdgeInsets.all(1.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/we-logo.png'),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Row(
              children: [Icon(Icons.settings)],
            ),
          ),
          TextButton(
            onPressed: () => navigator.pushNamed('/'),
            child: Row(
              children: [Icon(Icons.logout)],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/jay-kmutnb.jpg'),
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 450) {
            // Use a more Mobile-Friendly Layout with BottomNavigationBar
            // on Mobile
            return Column(
              children: [
                Expanded(child: mainArea),
                BottomNavigationBar(
                  items: [
                    const BottomNavigationBarItem(
                      icon: Icon(
                        Icons.dashboard,
                        color: Colors.black54,
                      ),
                      label: 'Dashboard',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.facebook,
                        color: Colors.black54, // Color(0xFF4267B2)
                      ),
                      label: 'Live',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.shopping_bag,
                        color: Colors.black54,
                      ),
                      label: 'Store',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.local_grocery_store,
                        color: Colors.black54,
                      ),
                      label: 'Orders',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.people,
                        color: Colors.black54,
                      ),
                      label: 'Customer',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.assignment,
                        color: Colors.black54,
                      ),
                      label: 'Report',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.history,
                        color: Colors.black54,
                      ),
                      label: 'History',
                    ),
                  ],
                  currentIndex: selectedIndex,
                  selectedItemColor: Colors.deepPurpleAccent,
                  onTap: (index) => setState(() => selectedIndex = index),
                ),
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
                      icon: Icon(Icons.dashboard),
                      label: Text('Dashboard'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.facebook),
                      label: Text('Facebook Live'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.shopping_bag),
                      label: Text('Store'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.local_grocery_store),
                      label: Text('Orders'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.people),
                      label: Text('Customer'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.assignment),
                      label: Text('Report'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.history),
                      label: Text('History'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.help),
                      label: Text('คำถามพบบ่อย'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.privacy_tip),
                      label: Text('Privacy'),
                    ),
                  ],
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (index) =>
                      setState(() => selectedIndex = index),
                )),
                Expanded(child: mainArea),
              ],
            );
          }
        },
      ),
    );
  }
}
