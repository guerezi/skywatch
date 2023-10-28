import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skywatch/domain/models/locations.dart';

abstract class SkywatchController extends Controller {
  void onComplete(String usecaseName) =>
      logger.info("$usecaseName Usecase Ended");

  void onError(dynamic error) {
    logger.severe(error);
    ScaffoldMessenger.of(getContext()).showSnackBar(SnackBar(
      content: Text("An error occoured: $error"),
    ));
  }

  Future<SharedPreferences> get prefs async =>
      await SharedPreferences.getInstance();

  Locations get userLocations =>
      Provider.of<Locations>(getContext(), listen: false);
}
