import 'package:flutter/material.dart';

import '../../../../main_common.dart';
import '../../../../model/ride/ride.dart';
import '../../../../model/ride_pref/ride_pref.dart';
import '../../../../utils/animations_util.dart';
import '../../../theme/theme.dart';
import './../view_model/ride_selection_model.dart';
import './ride_preference_modal.dart';
import './rides_selection_header.dart';
import './rides_selection_tile.dart';

///
/// Stateless content for the Ride Selection screen.
/// Rebuilds automatically whenever the view model notifies listeners.
///
class RidesSelectionContent extends StatelessWidget {
  const RidesSelectionContent({
    super.key,
    required this.viewModel,
    required this.dependencies,
  });

  final RidesSelectionModel viewModel;
  final AppDependencies dependencies;

  void _onBackTap(BuildContext context) {
    Navigator.pop(context);
  }

  void _onFilterPressed() {
    // TODO
  }

  void _onRideSelected(Ride ride) {
    // Later
  }

  Future<void> _onPreferencePressed(BuildContext context) async {
    final newPreference = await Navigator.of(context).push<RidePreference>(
      AnimationUtils.createRightToLeftRoute(
        RidePreferenceModal(
          initialPreference: viewModel.selectedPreference,
          locationRepository: dependencies.locationRepository,
          maxAllowedSeats: dependencies.maxAllowedSeats,
        ),
      ),
    );

    if (newPreference != null) {
      viewModel.onPreferenceSelected(newPreference);
    }
  }

  @override
  Widget build(BuildContext context) {
    // ListenableBuilder rebuilds this subtree whenever the VM calls notifyListeners()
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, _) {
        final preference = viewModel.selectedPreference;
        final rides = viewModel.matchingRides;

        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(
              left: BlaSpacings.m,
              right: BlaSpacings.m,
              top: BlaSpacings.s,
            ),
            child: Column(
              children: [
                if (preference != null)
                  RideSelectionHeader(
                    ridePreference: preference,
                    onBackPressed: () => _onBackTap(context),
                    onFilterPressed: _onFilterPressed,
                    onPreferencePressed: () => _onPreferencePressed(context),
                  ),

                const SizedBox(height: 100),

                Expanded(
                  child: rides.isEmpty
                      ? const Center(child: Text("No rides match your search."))
                      : ListView.builder(
                          itemCount: rides.length,
                          itemBuilder: (ctx, index) => RideSelectionTile(
                            ride: rides[index],
                            onPressed: () => _onRideSelected(rides[index]),
                          ),
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}