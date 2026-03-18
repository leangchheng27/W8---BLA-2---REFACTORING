import '../../../data/dummy_data.dart';
import '../../../model/ride/ride.dart';
import '../../../model/ride_pref/ride_pref.dart';
import 'ride_repository.dart';

class RideRepositoryMock implements RideRepository {
  @override
  List<Ride> getAllRides() {
    return fakeRides;
  }

  @override
  List<Ride> getRidesFor(RidePreference preference) {
    return fakeRides
        .where(
          (ride) =>
              ride.departureLocation == preference.departure &&
              ride.arrivalLocation == preference.arrival &&
              ride.availableSeats >= preference.requestedSeats,
        )
        .toList();
  }
}