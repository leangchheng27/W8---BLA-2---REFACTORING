import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../main_common.dart';
import '../../../../ui/states/ride_preference_state.dart';
import '../rides_selection/widgets/ride_selection_content.dart';
import '../rides_selection/view_model/ride_selection_model.dart';
///
/// The screen owns the ViewModel and passes it down to the content.
/// It is Stateful only because it needs to instantiate and dispose the VM.
///
class RidesSelectionScreen extends StatefulWidget {
  const RidesSelectionScreen({
    super.key,
    required this.dependencies,
  });

  final AppDependencies dependencies;

  @override
  State<RidesSelectionScreen> createState() => _RidesSelectionScreenState();
}

class _RidesSelectionScreenState extends State<RidesSelectionScreen> {
  late RidesSelectionModel _viewModel;

  @override
  void initState() {
    super.initState();
    final ridePreferenceState =
        context.read<RidePreferenceState>();
    _viewModel = RidesSelectionModel(
      ridePreferenceState,
      widget.dependencies.rideRepository,
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RidesSelectionContent(
      viewModel: _viewModel,
      dependencies: widget.dependencies,
    );
  }
}