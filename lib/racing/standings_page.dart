import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'StandingsTabs/constructor_standings.dart';
import 'StandingsTabs/driver_standings.dart';
import 'StandingsTabs/race_results_page.dart';

class StandingsPage extends StatefulWidget {
  const StandingsPage({super.key});

  @override
  _StandingsPageState createState() => _StandingsPageState();
}

class _StandingsPageState extends State<StandingsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('STANDINGS'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Drivers'),
            Tab(text: 'Constructors'),
            Tab(text: 'Race results'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        dragStartBehavior: DragStartBehavior.start,
        children: const [
          DriversStandings(),
          ConstructorsStandings(),
          RaceResults(),
        ],
      ),
    );
  }
}
