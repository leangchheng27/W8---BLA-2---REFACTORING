import 'package:flutter/material.dart';
import 'data/repositories/location/location_repository.dart';
import 'data/repositories/ride/ride_repository.dart';
import 'data/repositories/ride_preference/ride_preference_repository.dart';
import 'ui/screens/home/home_screen.dart';
import 'ui/theme/theme.dart';

void mainCommon(AppDependencies dependencies) {
  runApp(BlaBlaApp(dependencies: dependencies));
}

class AppDependencies {
  const AppDependencies({
    required this.locationRepository,
    required this.rideRepository,
    required this.ridePreferenceRepository,
    required this.maxAllowedSeats,
  });

  final LocationRepository locationRepository;
  final RideRepository rideRepository;
  final RidePreferenceRepository ridePreferenceRepository;
  final int maxAllowedSeats;
}

class BlaBlaApp extends StatelessWidget {
  const BlaBlaApp({super.key, required this.dependencies});

  final AppDependencies dependencies;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: blaTheme,
      home: Scaffold(
        body: HomeScreen(dependencies: dependencies),
      ),
    );
  }
}