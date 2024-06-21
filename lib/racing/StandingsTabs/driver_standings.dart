import 'package:flutter/material.dart';
import 'package:formula1/Data/driver_model.dart';
import 'package:provider/provider.dart';

class DriversStandings extends StatefulWidget {
  const DriversStandings({super.key});

  @override
  State<DriversStandings> createState() => _DriversStandingsState();
}

class _DriversStandingsState extends State<DriversStandings> {
  late Future<void> _driversFuture;

  @override
  void initState() {
    super.initState();
    _driversFuture = Provider.of<DriverModel>(context, listen: false).getDrivers();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DriverModel>(
      builder: (context, driverModel, child) {
        return FutureBuilder(
          future: _driversFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              }
              return ListView.builder(
                itemCount: driverModel.driver.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(driverModel.driver[index].name),
                    trailing: Text(driverModel.driver[index].constructor),
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
