// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart'
    as ca;
import 'package:skywatch/colors.dart';
import 'package:skywatch/pages/cities/cities_controller.dart';
import 'package:skywatch/pages/cities/cities_presenter.dart';
import 'package:skywatch/pages/utils.dart';
import 'package:skywatch/pages/widgets/city_tile.dart';
import 'package:skywatch/pages/widgets/skywatch_appbar.dart';
import 'package:skywatch/pages/widgets/skywatch_textfield.dart';

class CitiesView extends ca.View {
  const CitiesView({super.key, this.controller});

  final CitiesController? controller;

  @override
  State<CitiesView> createState() => _CitiesViewState(
        controller ??
            CitiesController(
              presenter: CitiesPresenter(),
            ),
      );
}

class _CitiesViewState extends ca.ViewState<CitiesView, CitiesController> {
  _CitiesViewState(super.controller);

  @override
  Widget get view => Scaffold(
        key: globalKey,
        appBar: const SkywatchAppBar(
          title: 'Yours Cities',
        ),
        body: ca.ControlledWidgetBuilder<CitiesController>(
          builder: (context, controller) {
            return SafeArea(
              child: Padding(
                padding: defaultPagePadding,
                child: Wrap(
                  children: [
                    SkyWatchTextField(
                      controller: controller.adressTextController,
                      label: "Search",
                    ),
                    InkWell(
                      onTap: controller.addCity,
                      child: Container(
                        decoration: BoxDecoration(
                          color: darkMode
                              ? SkyColors.primary
                              : SkyColors.secondary,
                          borderRadius: defaultBorderRadius,
                        ),
                        width: MediaQuery.of(context).size.width,
                        padding: defaultPadding,
                        child: Text(
                          'Add City',
                          style: Theme.of(context).textTheme.bodyMedium?.apply(
                                color: darkMode ? Colors.black : Colors.white,
                              ),
                        ),
                      ),
                    ),
                    ...controller.locations
                        .map((e) => CityTile(
                              location: e,
                              callback: () => controller.selectLocation(e),
                            ))
                        .toList()
                  ],
                ),
              ),
            );
          },
        ),
      );
}
