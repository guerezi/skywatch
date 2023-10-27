import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:skywatch/domain/models/location.dart';
import 'package:skywatch/domain/models/locations.dart';
import 'package:skywatch/pages/city_selector/city_selector_presenter.dart';
import 'package:skywatch/pages/common/skywatch_controller.dart';

class CitySelectorController extends SkywatchController {
  CitySelectorController({required this.presenter});

  final CitySelectorPresenter presenter;
  Timer? _timer;
  final adressTextController = TextEditingController();

  @override
  void onInitState() {
    super.onInitState();

    adressTextController.addListener(() {
      requestLocation(adressTextController.text);
    });
  }

  @override
  void initListeners() {
    initLocationListeners();
    initGPSListeners();
  }

  void initLocationListeners() {
    presenter.getLocationOnComplete = () => onComplete('Location');
    presenter.getLocationOnError = onError;
    presenter.getLocationOnNext = getLocationOnNext;
  }

  void requestLocation(String data) {
    _timer?.cancel();
    _timer = Timer(const Duration(milliseconds: 500), () {
      presenter.getLocation(data);
    });
  }

  void getLocationOnNext(Location location) {
    getContext().watch<Locations>().addLocation(location);
  }

  void initGPSListeners() {
    presenter.getGPSOnComplete = () => onComplete('GPS');
    presenter.getGPSOnError = onError;
    presenter.getGPSOnNext = getGPSOnNext;
  }

  void getGPSOnNext(Position pos) {
    print(pos);
  }

  Future<void> requestGPSPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
  }

  @override
  void onDisposed() {
    presenter.dispose();
    super.onDisposed();
  }
}
