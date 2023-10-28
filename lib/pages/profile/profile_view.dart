// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart'
    as ca;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:skywatch/colors.dart';
import 'package:skywatch/data/repositories/user_repository.dart';
import 'package:skywatch/pages/profile/profile_controller.dart';
import 'package:skywatch/pages/profile/profile_presenter.dart';
import 'package:skywatch/pages/utils.dart';
import 'package:skywatch/pages/widgets/skywatch_appbar.dart';
import 'package:skywatch/pages/widgets/skywatch_textfield.dart';

class ProfileView extends ca.View {
  const ProfileView({super.key, this.controller});

  final ProfileController? controller;

  @override
  State<ProfileView> createState() => _ProfileViewState(
        controller ??
            ProfileController(
              presenter: ProfilePresenter(
                userRepository: UserRepository(),
              ),
            ),
      );
}

class _ProfileViewState extends ca.ViewState<ProfileView, ProfileController> {
  _ProfileViewState(super.controller);

  @override
  Widget get view => Scaffold(
        key: globalKey,
        appBar: const SkywatchAppBar(title: 'Yours Profile'),
        body: ca.ControlledWidgetBuilder<ProfileController>(
          builder: (context, controller) {
            return Container(
              padding: defaultPagePadding,
              child: controller.user != null
                  ? Column(
                      children: [
                        _photo,
                        const SizedBox(
                          height: 80,
                        ),
                        infoLine(
                          'Name',
                          controller.user!.name,
                        ),
                        infoLine(
                          'Level',
                          controller.user!.level.toString(),
                        ),
                        infoLine(
                          'HomeTown',
                          controller.user!.hometown,
                        ),
                      ],
                    )
                  : SpinKitRotatingPlain(
                      color: SkyColors.primary,
                    ),
            );
          },
        ),
      );

  Widget get _photo => const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          FlutterLogo(
            size: 100,
          ),
          Text('Update picture')
        ],
      );

  Widget infoLine(String title, String info) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: SkyWatchTextField(
          controller: TextEditingController(text: info),
          label: title,
          enabled: false,
        ),
      );
}
