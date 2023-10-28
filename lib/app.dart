import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skywatch/colors.dart';
import 'package:skywatch/domain/models/locations.dart';
import 'package:skywatch/route/router.dart';

class SkyWatch extends StatelessWidget {
  const SkyWatch({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Locations>(create: (_) => Locations()),
        // Provider<User>(create: (_) => Something()), Should have a login screen
      ],
      child: MaterialApp.router(
        title: 'Flutter Widget Demo',
        darkTheme: SkyColors.dark,
        theme: SkyColors.light,
        themeMode: ThemeMode.system,
        routerConfig: SkyWatchRouter.router,
      ),
    );
  }
}
