// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart'
    as ca;
import 'package:skywatch/data/repositories/geolocation_repository.dart';
import 'package:skywatch/device/repositoreis/gps_repository.dart';
import 'package:skywatch/pages/city_selector/city_selector_controller.dart';
import 'package:skywatch/pages/city_selector/city_selector_presenter.dart';

class CitySelectorView extends ca.View {
  const CitySelectorView({super.key, this.controller});

  final CitySelectorController? controller;

  @override
  State<CitySelectorView> createState() => _CitySelectorViewState(
        controller ??
            CitySelectorController(
              presenter: CitySelectorPresenter(
                geolocationRespository: GeolocationRepository(),
                gpsRepository: GPSRepository(),
              ),
            ),
      );
}

class _CitySelectorViewState
    extends ca.ViewState<CitySelectorView, CitySelectorController> {
  _CitySelectorViewState(super.controller);

  @override
  Widget get view => Scaffold(
        body: Center(
          child: ca.ControlledWidgetBuilder<CitySelectorController>(
            builder: (context, controller) {
              return Wrap(
                children: [
                  TextField(
                    controller: controller.adressTextController,
                  )
                ],
              );
            },
          ),
        ),
      );
}
