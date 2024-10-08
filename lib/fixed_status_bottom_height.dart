library fixed_status_bottom_height;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FixedStatusBottomHeight extends StatefulWidget {
  static ValueNotifier<double> maxBottomPaddingHeight = ValueNotifier(0.0);

  const FixedStatusBottomHeight({super.key});

  @override
  State<FixedStatusBottomHeight> createState() =>
      _FixedStatusBottomHeightState();
}

class _FixedStatusBottomHeightState extends State<FixedStatusBottomHeight>
    with WidgetsBindingObserver {
  SharedPreferences? prefs;

  // To avoid purple up and pop down animation when the keyboard switch.
  final String _maxBottomPaddingHeightKey = '_maxBottomPaddingHeightKey';

  /// Avoid some error.
  final double _maxBottomPaddingHeightValueDef = 100;

  @override
  void initState() {
    super.initState();
    initPref().then((_) {
      initPrefValue();
    });
    WidgetsBinding.instance.addObserver(this);
  }

  Future<void> initPref() async {
    /// Get the shared preferences instance.
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> initPrefValue() async {
    final value = prefs!.getDouble(_maxBottomPaddingHeightKey);
    if (value != null) {
      FixedStatusBottomHeight.maxBottomPaddingHeight.value = value;
    }
  }

  @override
  void didChangeMetrics() {
    updateBottomPaddingHeight(MediaQuery.of(context).padding.bottom);
  }

  void updateBottomPaddingHeight(double newValue) {
    if (newValue > FixedStatusBottomHeight.maxBottomPaddingHeight.value &&
        newValue < _maxBottomPaddingHeightValueDef) {
      FixedStatusBottomHeight.maxBottomPaddingHeight.value = newValue;

      prefs?.setDouble(_maxBottomPaddingHeightKey,
          FixedStatusBottomHeight.maxBottomPaddingHeight.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }
}
