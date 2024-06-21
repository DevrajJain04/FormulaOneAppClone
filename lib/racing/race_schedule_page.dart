import 'package:flutter/material.dart';
import 'package:formula1/widgets/race_schedule_tile.dart';

class RacingPage extends StatefulWidget {
  const RacingPage({super.key});

  @override
  RacingPageState createState() => RacingPageState();
}

class RacingPageState extends State<RacingPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
        title: const Text('RACING'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Upcoming'),
            Tab(text: 'Past'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          UpcomingRaces(),
          PastRaces(),
        ],
      ),
    );
  }
}

class UpcomingRaces extends StatelessWidget {
  const UpcomingRaces({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
         RaceSchedTile(
          round: 10,
          country: 'Spain',
          date: '21-23',
          month: 'JUN',
          description: 'FORMULA 1 ARAMCO GRAN PREMIO DE ESPAÑA 2024',
        ),
         RaceSchedTile(
          round: 11,
          country: 'Austria',
          date: '28-30',
          month: 'JUN',
          description: 'FORMULA 1 QATAR AIRWAYS AUSTRIAN GRAND PRIX 2024',
        ),
        // Add more RaceTile widgets here
      ],
    );
  }
}

class PastRaces extends StatelessWidget {
  const PastRaces({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
        RaceSchedTile(
          round: 9,
          country: 'Monaco',
          date: '26-28',
          month: 'MAY',
          description: 'FORMULA 1 GRAND PRIX DE MONACO 2024',
        ),
      ],
    );
  }
}
