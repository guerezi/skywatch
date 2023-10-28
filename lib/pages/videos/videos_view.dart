// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart'
    as ca;
import 'package:skywatch/pages/utils.dart';
import 'package:skywatch/pages/videos/videos_controller.dart';
import 'package:skywatch/pages/videos/videos_presenter.dart';
import 'package:skywatch/pages/widgets/skywatch_appbar.dart';

class VideosView extends ca.View {
  const VideosView({super.key, this.controller});

  final VideosController? controller;

  @override
  State<VideosView> createState() => _VideosViewState(
        controller ??
            VideosController(
              presenter: VideosPresenter(),
            ),
      );
}

class _VideosViewState extends ca.ViewState<VideosView, VideosController> {
  _VideosViewState(super.controller);

  @override
  Widget get view => Scaffold(
        key: globalKey,
        appBar: const SkywatchAppBar(title: 'Yours Videos'),
        body: ca.ControlledWidgetBuilder<VideosController>(
          builder: (context, controller) {
            return const SafeArea(
              child: Padding(
                padding: defaultPagePadding,
              ),
            );
          },
        ),
      );
}
