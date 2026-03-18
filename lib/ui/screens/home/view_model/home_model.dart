import 'package:flutter/foundation.dart';
import '../../../../ui/states/ride_preference_state.dart';
import '../../../../model/ride_pref/ride_pref.dart';

class HomeModel extends ChangeNotifier {
  final RidePreferenceState _ridePreferenceState;

  HomeModel(this._ridePreferenceState) {
    _ridePreferenceState.addListener(_onStateChanged);
  }

  void _onStateChanged() {
    notifyListeners();
  }

  RidePreference? get selectedPreference => _ridePreferenceState.selectedPreference;
  List<RidePreference> get preferenceHistory => _ridePreferenceState.preferenceHistory;

  void selectPreference(RidePreference newPreference) {
    _ridePreferenceState.selectPreference(newPreference);
  }

  @override
  void dispose() {
    _ridePreferenceState.removeListener(_onStateChanged);
    super.dispose();
  }
}