import '../../../data/dummy_data.dart';
import '../../../model/ride_pref/ride_pref.dart';
import 'ride_preference_repository.dart';

class RidePreferenceRepositoryMock implements RidePreferenceRepository {
  final List<RidePreference> _history = List<RidePreference>.from(fakeRidePrefs);

  @override
  List<RidePreference> getHistory() {
    return List<RidePreference>.from(_history);
  }

  @override
  void savePreference(RidePreference preference) {
    _history.add(preference);
  }

  @override
  void clearHistory() {
    _history.clear();
  }
}