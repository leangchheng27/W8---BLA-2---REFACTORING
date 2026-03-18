import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../main_common.dart';
import '../../../../ui/states/ride_preference_state.dart';
import './view_model/home_model.dart';
import './widgets/home_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.dependencies});

  final AppDependencies dependencies;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeModel _model;
  bool _initialized = false; 

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      final ridePreferenceState = context.read<RidePreferenceState>();
      _model = HomeModel(ridePreferenceState);
      _model.addListener(_onModelChanged);
      _initialized = true;
    }
  }

  void _onModelChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    _model.removeListener(_onModelChanged);
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HomeContent(
      model: _model,
      dependencies: widget.dependencies,
    );
  }
}