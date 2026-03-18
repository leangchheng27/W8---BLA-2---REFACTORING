import '../../../model/ride/locations.dart';

abstract class LocationRepository {
  List<Location> getAvailableLocations();
  List<Location> searchLocations(String query);
}