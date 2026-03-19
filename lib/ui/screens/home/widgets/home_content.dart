import 'package:flutter/material.dart';
import '../../../../main_common.dart';
import '../../../../model/ride_pref/ride_pref.dart';
import '../../../../utils/animations_util.dart';
import '../../../theme/theme.dart';
import '../../../widgets/pickers/bla_ride_preference_picker.dart';
import '../../rides_selection/rides_selection_screen.dart';
import '../view_model/home_model.dart';
import 'home_history_tile.dart';

const String blablaHomeImagePath = 'assets/images/blabla_home.png';

class HomeContent extends StatelessWidget {
  const HomeContent({
    super.key,
    required this.model,
    required this.dependencies,
  });

  final HomeModel model;
  final AppDependencies dependencies;

  void _onRidePrefSelected(BuildContext context, RidePreference newPreference) async {
    model.selectPreference(newPreference);

    await Navigator.of(context).push(
      AnimationUtils.createBottomToTopRoute(
        RidesSelectionScreen(
          dependencies: dependencies,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      _buildBackground(),
      _buildForeground(context),
    ]);
  }

  Widget _buildForeground(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Align(
          alignment: AlignmentGeometry.center,
          child: Text(
            "Your pick of rides at low price",
            style: BlaTextStyles.heading.copyWith(color: Colors.white),
          ),
        ),
        const SizedBox(height: 100),
        Container(
          margin: EdgeInsets.symmetric(horizontal: BlaSpacings.xxl),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BlaRidePreferencePicker(
                initRidePreference: model.selectedPreference,
                locationRepository: dependencies.locationRepository,
                maxAllowedSeats: dependencies.maxAllowedSeats,
                onRidePreferenceSelected: (pref) => _onRidePrefSelected(context, pref),
              ),
              SizedBox(height: BlaSpacings.m),
              _buildHistory(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHistory(BuildContext context) {
    final history = model.preferenceHistory.reversed.toList();
    return SizedBox(
      height: 200,
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: history.length,
        itemBuilder: (ctx, index) => HomeHistoryTile(
          ridePref: history[index],
          onPressed: () => _onRidePrefSelected(context, history[index]),
        ),
      ),
    );
  }

  Widget _buildBackground() {
    return SizedBox(
      width: double.infinity,
      height: 340,
      child: Image.asset(
        blablaHomeImagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}