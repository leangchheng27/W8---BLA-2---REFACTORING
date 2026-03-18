import 'data/repositories/location/location_repository_mock.dart';
import 'data/repositories/ride/ride_repository_mock.dart';
import 'data/repositories/ride_preference/ride_preference_repository_mock.dart';
import 'main_common.dart';

void mainDev() {
  final dependencies = AppDependencies(
    locationRepository: LocationRepositoryMock(),
    rideRepository: RideRepositoryMock(),
    ridePreferenceRepository: RidePreferenceRepositoryMock(),
    maxAllowedSeats: 8,
  );

  mainCommon(dependencies);
}