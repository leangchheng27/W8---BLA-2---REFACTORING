import 'package:flutter/foundation.dart';
import '../../../../data/repositories/ride/ride_repository.dart';
import '../../../../model/ride/ride.dart';
import '../../../../model/ride_pref/ride_pref.dart';
import '../../../../ui/states/ride_preference_state.dart';

class RidesSelectionModel extends ChangeNotifier {
  final RidePreferenceState _ridePreferenceState;
  final RideRepository _rideRepository;

  RidesSelectionModel(this._ridePreferenceState, this._rideRepository) {
    _ridePreferenceState.addListener(_onStateChanged);
  }

  void _onStateChanged() {
    notifyListeners();
  }

  RidePreference? get selectedPreference =>
      _ridePreferenceState.selectedPreference;

  List<RidePreference> get preferenceHistory =>
      _ridePreferenceState.preferenceHistory;

  List<Ride> get matchingRides {
    if (selectedPreference == null) return [];
    return _rideRepository.getRidesFor(selectedPreference!);
  }

  void onPreferenceSelected(RidePreference newPreference) {
    _ridePreferenceState.selectPreference(newPreference);
  }

  @override
  void dispose() {
    _ridePreferenceState.removeListener(_onStateChanged);
    super.dispose();
  }
}