// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart'
    as ca;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:skywatch/colors.dart';
import 'package:skywatch/data/repositories/weather_repository.dart';
import 'package:skywatch/pages/utils.dart';
import 'package:skywatch/pages/weather/weather_controller.dart';
import 'package:skywatch/pages/weather/weather_presenter.dart';
import 'package:skywatch/pages/widgets/skywatch_appbar.dart';

class WeatherView extends ca.View {
  const WeatherView({super.key, this.controller});

  final WeatherController? controller;

  @override
  State<WeatherView> createState() => _WeatherViewState(
        controller ??
            WeatherController(
              presenter: WeatherPresenter(
                weatherRespository: WeatherRespository(),
              ),
            ),
      );
}

class _WeatherViewState extends ca.ViewState<WeatherView, WeatherController> {
  _WeatherViewState(super.controller);

  @override
  Widget get view => ca.ControlledWidgetBuilder<WeatherController>(
        builder: (context, controller) {
          return Scaffold(
            key: globalKey,
            appBar: SkywatchAppBar(
              title: 'Weather of ${controller.city?.name ?? "..."}',
              actions: [
                InkWell(
                  onTap: controller.changeCity,
                  child: Container(
                    decoration: BoxDecoration(
                      color: darkMode ? SkyColors.primary : SkyColors.secondary,
                      borderRadius: defaultBorderRadius,
                    ),
                    padding: defaultPadding,
                    child: Text(
                      'Change',
                      style: Theme.of(context).textTheme.bodyMedium?.apply(
                            color: darkMode ? Colors.black : Colors.white,
                          ),
                    ),
                  ),
                )
              ],
            ),
            body: controller.city?.weather != null
                ? _body(controller)
                : SpinKitRotatingPlain(
                    color: SkyColors.primary,
                  ),
          );
        },
      );

  Widget _body(WeatherController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: Stack(children: [
            Image.asset('assets/sunny.jpg'),
            Positioned(
              top: 0,
              bottom: 0,
              child: Text(
                "${controller.city!.weather!.main.temp}º F", // Just F, did not have the time to do Celsius
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
          ]),
        ),
        Row(
          children: [
            Text(
              "Max: ${controller.city!.weather!.main.tempMax}º F | ",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Text(
              "Min: ${controller.city!.weather!.main.tempMin}º F",
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ],
        ),
      ],
    );
  }
}
