import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:skywatch/constants.dart';
import 'package:skywatch/domain/models/latlgn.dart';
import 'package:skywatch/domain/models/location.dart';
import 'package:skywatch/pages/city_selector/city_selector_presenter.dart';
import 'package:skywatch/pages/common/skywatch_controller.dart';

class CitySelectorController extends SkywatchController {
  CitySelectorController({required this.presenter});

  final CitySelectorPresenter presenter;
  Timer? _timer;
  final adressTextController = TextEditingController();
  Position? gpsLocation;
  final locations = <Location>[];

  @override
  void onInitState() {
    super.onInitState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      requestGPSPermission().then((value) {
        if (value) presenter.getPosition();
      });
    });

    adressTextController.addListener(() {
      requestLocation(adressTextController.text);
    });
  }

  @override
  void initListeners() {
    initLocationListeners();
    initLocationByLatLngListeners();
    initGPSListeners();
  }

  void initLocationListeners() {
    presenter.getLocationOnComplete = () => onComplete('Location');
    presenter.getLocationOnError = onError;
    presenter.getLocationOnNext = getLocationOnNext;
  }

  void requestLocation(String data) {
    _timer?.cancel();
    if (data.length > 3) {
      _timer = Timer(const Duration(milliseconds: 500), () {
        presenter.getLocation(data);
      });
    }
  }

  void getLocationOnNext(List<Location> location) {
    locations.clear();
    locations.addAll(location);
    refreshUI();
  }

  void initGPSListeners() {
    presenter.getGPSOnComplete = () => onComplete('GPS');
    presenter.getGPSOnError = onError;
    presenter.getGPSOnNext = getGPSOnNext;
  }

  void getGPSOnNext(Position pos) {
    gpsLocation = pos;
    refreshUI();
  }

  void initLocationByLatLngListeners() {
    presenter.getLocationBylatlngOnComplete =
        () => onComplete('ReverseLocation');
    presenter.getLocationBylatlngOnError = onError;
    presenter.getLocationBylatlngOnNext = getLocationBylatlngOnNext;
  }

  void getReverseLocation() {
    presenter.getLocationByLatLng(
      LatLng(gpsLocation!.latitude, gpsLocation!.longitude),
    );
  }

  void getLocationBylatlngOnNext(Location location) {
    locations.add(location);
    refreshUI();
  }

  Future<bool> requestGPSPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return false;
    }

    return true;
  }

  Future<void> selectLocation(Location location) async {
    userLocations.addLocation(location);

    Navigator.of(getContext()).pop();
    final prefferences = await prefs;

    prefferences.setString(
      Prefs.cities,
      json.encode(userLocations.getLocations.map((e) => e.toMap()).toList()),
    );
  }

  @override
  void onDisposed() {
    presenter.dispose();
    super.onDisposed();
  }
}
