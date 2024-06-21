import 'package:flutter/material.dart';
import 'package:formula1/Data/constructor_model.dart';
import 'package:provider/provider.dart';

class ConstructorsStandings extends StatefulWidget {
  const ConstructorsStandings({super.key});

  @override
  State<ConstructorsStandings> createState() => _ConstructorsStandingsState();
}

class _ConstructorsStandingsState extends State<ConstructorsStandings> {
  late Future<void> _constructorsFuture;

  @override
  void initState() {
    super.initState();
    _constructorsFuture = Provider.of<ConstructorModel>(context, listen: false).getConstructor();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ConstructorModel>(
      builder: (context, constructorModel, child) {
        return FutureBuilder(
          future: _constructorsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              }
              return ListView.builder(
                itemCount: constructorModel.constructor.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(constructorModel.constructor[index].name),
                    subtitle: Text(constructorModel.constructor[index].points),
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
