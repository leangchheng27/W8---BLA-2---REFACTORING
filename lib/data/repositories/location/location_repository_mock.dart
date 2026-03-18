import '../../../data/dummy_data.dart';
import '../../../model/ride/locations.dart';
import 'location_repository.dart';

class LocationRepositoryMock implements LocationRepository {
  @override
  List<Location> getAvailableLocations() {
    return fakeLocations;
  }

  @override
  List<Location> searchLocations(String query) {
    if (query.trim().length < 2) return [];
    final upper = query.toUpperCase();
    return fakeLocations
        .where((location) => location.name.toUpperCase().contains(upper))
        .toList();
  }
}