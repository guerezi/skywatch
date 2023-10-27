import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

abstract class SkywatchController extends Controller {
  void onComplete(String usecaseName) =>
      logger.info("$usecaseName Usecase Ended");

  void onError(dynamic error) {
    ScaffoldMessenger.of(getContext()).showSnackBar(SnackBar(
      content: Text("An error occoured: $error"),
    ));
  }
}
