import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skywatch/domain/models/location.dart';
import 'package:skywatch/pages/common/skywatch_controller.dart';
import 'package:skywatch/pages/videos/videos_presenter.dart';

class VideosController extends SkywatchController {
  VideosController({required this.presenter});

  final VideosPresenter presenter;

  final adressTextController = TextEditingController();
  final locations = <Location>[];

  @override
  void onInitState() {
    super.onInitState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      locations.addAll(userLocations.getLocations);
    });

    adressTextController.addListener(() {
      searchLocation(adressTextController.text);
    });
  }

  @override
  void initListeners() {}

  void searchLocation(String address) {
    final savedLocations = userLocations.getLocations;
    locations.clear();

    locations.addAll(address.isNotEmpty
        ? savedLocations.where((l) => l.name.contains(address))
        : savedLocations);
  }

  void selectLocation(Location location) {
    getContext().pop(location);
  }

  @override
  void onDisposed() {
    presenter.dispose();
    super.onDisposed();
  }
}
