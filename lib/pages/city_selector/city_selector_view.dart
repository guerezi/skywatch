// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart'
    as ca;
import 'package:skywatch/colors.dart';
import 'package:skywatch/data/repositories/geolocation_repository.dart';
import 'package:skywatch/device/repositoreis/gps_repository.dart';
import 'package:skywatch/pages/city_selector/city_selector_controller.dart';
import 'package:skywatch/pages/city_selector/city_selector_presenter.dart';
import 'package:skywatch/pages/utils.dart';
import 'package:skywatch/pages/widgets/city_tile.dart';
import 'package:skywatch/pages/widgets/skywatch_appbar.dart';
import 'package:skywatch/pages/widgets/skywatch_textfield.dart';

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
        key: globalKey,
        appBar: const SkywatchAppBar(title: 'Add New City'),
        body: ca.ControlledWidgetBuilder<CitySelectorController>(
          builder: (context, controller) {
            return SafeArea(
              child: Padding(
                padding: defaultPagePadding,
                child: Wrap(
                  children: [
                    SkyWatchTextField(
                      controller: controller.adressTextController,
                      label: "Write at least 3 characters",
                    ),
                    if (controller.gpsLocation != null)
                      _useCurrentLocation(controller.getReverseLocation),
                    _locations(controller),
                  ],
                ),
              ),
            );
          },
        ),
      );

  Widget _locations(CitySelectorController controller) => ListView(
        shrinkWrap: true,
        children: controller.locations
            .map(
              (e) => CityTile(
                location: e,
                callback: () => controller.selectLocation(e),
              ),
            )
            .toList(),
      );

  Widget _useCurrentLocation(VoidCallback callback) => Padding(
        padding: defaultPadding,
        child: Row(
          children: [
            const Expanded(
              child: Text('Use your GPS location?'),
            ),
            InkWell(
              onTap: callback,
              borderRadius: BorderRadius.circular(50),
              child: Ink(
                decoration: BoxDecoration(
                  color: SkyColors.primary,
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 18,
                ),
                child: const Text("Use"),
              ),
            )
          ],
        ),
      );
}
