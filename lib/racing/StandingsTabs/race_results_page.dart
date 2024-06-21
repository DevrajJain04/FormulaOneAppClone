import 'package:flutter/material.dart';
import 'package:formula1/Data/race_results_model.dart';
import 'package:provider/provider.dart';
import '../../widgets/race_result_tile.dart';

class RaceResults extends StatefulWidget {
  const RaceResults({super.key});

  @override
  State<RaceResults> createState() => _RaceResultsState();
}

class _RaceResultsState extends State<RaceResults> {
  late Future<void> _raceResultFuture;

  @override
  void initState() {
    super.initState();
    _raceResultFuture =
        Provider.of<RaceResultsModel>(context, listen: false).getRaceResults();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RaceResultsModel>(
      builder: (context, raceResultModel, child) {
        return FutureBuilder(
          future: _raceResultFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              }
              return ListView.builder(
                itemCount: raceResultModel.raceResults.length,
                itemBuilder: (context, index) {
                  return RaceResultTile(
                    date: raceResultModel.raceResults[index].date,
                    winner: raceResultModel.raceResults[index].winner,
                    grandprix: raceResultModel.raceResults[index].grandPrix,
                    description:
                        '${raceResultModel.raceResults[index].time} - ${raceResultModel.raceResults[index].laps}',
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        );
      },
    );
  }
}
