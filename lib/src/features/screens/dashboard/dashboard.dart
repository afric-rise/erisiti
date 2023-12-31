import 'package:erisiti/src/features/screens/dashboard/features/bottombar.dart';
import 'package:erisiti/src/features/screens/dashboard/features/home/home.dart';
import 'package:erisiti/src/features/screens/dashboard/features/more/more.dart';
import 'package:flutter/material.dart';

import 'features/receipts/search/search.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key, required this.loggedUser});
  final Map loggedUser;

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  PageController controller = PageController();
  int currentIndex = 0;
  int currentPageValue = 0;
  List<Widget> pages = [];

  @override
  void initState() {
    setState(() {
      pages.add(
        HomePage(
          loggedUser: widget.loggedUser,
        ),
      );
      pages.add(const SearchReceiptPage());
      pages.add(const MorePage());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPageValue],
      bottomNavigationBar: BottomNavigation(
        currentPage: (currentPage) {
          setState(() {
            currentPageValue = currentPage;
          });
        },
      ),
    );
  }
}
