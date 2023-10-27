import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skywatch/domain/models/locations.dart';
import 'package:skywatch/route/router.dart';

class SkyWatch extends StatelessWidget {
  const SkyWatch({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Locations>(create: (_) => Locations()),
        // Provider<User>(create: (_) => Something()),
      ],
      child: MaterialApp.router(
        title: 'Flutter Widget Demo',
        theme: ThemeData(
          primaryColor: const Color(0xFFf6622d),
          hintColor: const Color(0xFF1e2a40),
          scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        ),
        // home: const WelcomeView(),
        routerConfig: SkyWatchRouter.router,
      ),
    );
  }
}
