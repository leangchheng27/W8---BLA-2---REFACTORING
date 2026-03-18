import 'package:flutter/foundation.dart';

import '../../data/repositories/ride_preference/ride_preference_repository.dart';
import '../../model/ride_pref/ride_pref.dart';

class RidePreferenceState extends ChangeNotifier {
  RidePreferenceState({required this.ridePreferenceRepository}) {
    preferenceHistory = ridePreferenceRepository.getHistory();
    if (preferenceHistory.isNotEmpty) {
      _selectedPreference = preferenceHistory.last;
    }
  }

  final RidePreferenceRepository ridePreferenceRepository;

  RidePreference? _selectedPreference;
  RidePreference? get selectedPreference => _selectedPreference;

  List<RidePreference> preferenceHistory = [];

  void selectPreference(RidePreference newPreference) {
    if (_selectedPreference == newPreference) return;

    _selectedPreference = newPreference;
    ridePreferenceRepository.savePreference(newPreference);
    preferenceHistory = ridePreferenceRepository.getHistory();
    notifyListeners();
  }
}