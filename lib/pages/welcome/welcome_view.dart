// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart'
    as ca;
import 'package:go_router/go_router.dart';
import 'package:skywatch/colors.dart';
import 'package:skywatch/data/repositories/geolocation_repository.dart';
import 'package:skywatch/device/repositoreis/gps_repository.dart';
import 'package:skywatch/pages/utils.dart';
import 'package:skywatch/pages/welcome/welcome_controller.dart';
import 'package:skywatch/pages/welcome/welcome_presenter.dart';
import 'package:skywatch/pages/widgets/skywatch_appbar.dart';
import 'package:skywatch/pages/widgets/skywatch_button.dart';
import 'package:skywatch/route/routes.dart';

class WelcomeView extends ca.View {
  const WelcomeView({super.key, this.controller});

  final WelcomeController? controller;

  @override
  State<WelcomeView> createState() => _WelcomeViewState(
        controller ??
            WelcomeController(
              presenter: WelcomePresenter(
                geolocationRespository: GeolocationRepository(),
                gpsRepository: GPSRepository(),
              ),
            ),
      );
}

class _WelcomeViewState extends ca.ViewState<WelcomeView, WelcomeController> {
  _WelcomeViewState(super.controller);
  final advancedDrawerController = AdvancedDrawerController();

  @override
  Widget get view => AdvancedDrawer(
        backdrop: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: darkMode
                  ? [
                      SkyColors.secondary,
                      SkyColors.primary.shade700,
                    ]
                  : [
                      SkyColors.secondary.shade300,
                      SkyColors.primary.shade300,
                    ],
            ),
          ),
        ),
        controller: advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        animateChildDecoration: true,
        childDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
        ),
        drawer: _drawer,
        child: _body,
      );

  Widget get _body => Scaffold(
        key: globalKey,
        appBar: SkywatchAppBar(
          title: 'Welcome',
          leading: _drawerButton,
        ),
        body: Center(
          child: ca.ControlledWidgetBuilder<WelcomeController>(
            builder: (context, controller) {
              return Column(
                children: [
                  Text(
                    'SkyWatch',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  SkywatchButton(
                    callback: () {
                      context.go(Routes.city.path);
                      setState(() {});
                    },
                    title: "Add City",
                  ),
                  SkywatchButton(
                    callback: () => context.go(Routes.weather.path),
                    title: "See the weather",
                    active: controller.userLocations.getLocations.isNotEmpty,
                  ),
                  SkywatchButton(
                    callback: () => context.go(Routes.videos.path),
                    title: "Go to the videos",
                  ),
                ],
              );
            },
          ),
        ),
      );

  Widget get _drawerButton => IconButton(
        onPressed: advancedDrawerController.showDrawer,
        icon: ValueListenableBuilder<AdvancedDrawerValue>(
          valueListenable: advancedDrawerController,
          builder: (_, value, __) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: Icon(
                value.visible ? Icons.clear : Icons.menu,
                key: ValueKey<bool>(value.visible),
                color: darkMode ? SkyColors.mono[0] : SkyColors.mono[1000],
              ),
            );
          },
        ),
      );

  Widget get _drawer => Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).padding.top + 24,
          horizontal: 32,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FlutterLogo(size: 120),
            const SizedBox(
              height: 32,
            ),
            ListTile(
              title: _drawerTitle('Profile'),
              leading: _leading(Icons.person),
              onTap: () => context.go(Routes.profile.path),
            ),
            ListTile(
              title: _drawerTitle('Cities'),
              leading: _leading(Icons.location_city_rounded),
              onTap: () => context.go(Routes.cities.path),
            ),
            ListTile(
              title: _drawerTitle('Exit'),
              leading: _leading(Icons.exit_to_app_rounded),
              onTap: () {
                // should logout, I do not have this option currently
                SystemNavigator.pop();
              },
            ),
          ],
        ),
      );

  Widget _drawerTitle(String data) {
    return Text(
      data,
      style: Theme.of(context)
          .textTheme
          .displaySmall
          ?.apply(color: SkyColors.mono[0]),
    );
  }

  Widget _leading(IconData data) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 1),
      child: Icon(
        data,
        color: SkyColors.mono[0],
      ),
    );
  }
}
