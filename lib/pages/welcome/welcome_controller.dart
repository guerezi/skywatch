import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:skywatch/constants.dart';
import 'package:skywatch/domain/models/location.dart';
import 'package:skywatch/pages/common/skywatch_controller.dart';
import 'package:skywatch/pages/welcome/welcome_presenter.dart';

class WelcomeController extends SkywatchController {
  WelcomeController({required this.presenter});

  final WelcomePresenter presenter;

  Location? location;

  @override
  void onInitState() {
    super.onInitState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        final prefferences = await prefs;
        final cities = prefferences.getString(Prefs.cities);
        if (cities?.isNotEmpty ?? false) {
          final decoded = json.decode(cities!);

          for (final city in (decoded as List)) {
            userLocations.addLocation(Location.fromMap(city));
          }
          refreshUI();
        }
      },
    );
  }

  @override
  void initListeners() {}

  @override
  void onDisposed() {
    presenter.dispose();
    super.onDisposed();
  }
}
