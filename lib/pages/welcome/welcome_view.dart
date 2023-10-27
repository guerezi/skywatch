// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart'
    as ca;
import 'package:go_router/go_router.dart';
import 'package:skywatch/data/repositories/geolocation_repository.dart';
import 'package:skywatch/data/repositories/weather_repository.dart';
import 'package:skywatch/device/repositoreis/gps_repository.dart';
import 'package:skywatch/pages/welcome/welcome_controller.dart';
import 'package:skywatch/pages/welcome/welcome_presenter.dart';
import 'package:skywatch/route/routes.dart';

class WelcomeView extends ca.View {
  const WelcomeView({super.key, this.controller});

  final WelcomeController? controller;

  @override
  State<WelcomeView> createState() => _WelcomeViewState(
        controller ??
            WelcomeController(
              presenter: WelcomePresenter(
                weatherRespository: WeatherRespository(),
                geolocationRespository: GeolocationRepository(),
                gpsRepository: GPSRepository(),
              ),
            ),
      );
}

class _WelcomeViewState extends ca.ViewState<WelcomeView, WelcomeController> {
  _WelcomeViewState(super.controller);

  @override
  Widget get view => Scaffold(
        body: Center(
          child: ca.ControlledWidgetBuilder<WelcomeController>(
            builder: (context, controller) {
              return Wrap(
                children: [
                  InkWell(
                    onTap: () => context.go(Routes.city.path),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: const Text('Add City'),
                    ),
                  ),
                  InkWell(
                    onTap: () => print('Second'),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: const Text('See the weather'),
                    ),
                  ),
                  InkWell(
                    onTap: () => print('Third'),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: const Text('Go to the videos'),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      );
}
