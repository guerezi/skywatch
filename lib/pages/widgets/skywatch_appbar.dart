import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skywatch/colors.dart';
import 'package:skywatch/pages/utils.dart';

class SkywatchAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String title;
  final List<Widget> actions;
  final VoidCallback? backAction;
  final bool centerTitle;
  final int? maxLines;
  final TextOverflow overflow;
  final TextAlign textAlign;
  final Widget? leading;
  final TextStyle? style;
  final SystemUiOverlayStyle? systemOverlayStyle;

  const SkywatchAppBar({
    Key? key,
    required this.title,
    this.actions = const [],
    this.backAction,
    this.centerTitle = false,
    this.maxLines,
    this.overflow = TextOverflow.visible,
    this.textAlign = TextAlign.center,
    this.leading,
    this.style,
    this.systemOverlayStyle,
  })  : preferredSize = const Size.fromHeight(55),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor:
            darkMode ? SkyColors.secondary : SkyColors.secondary.shade300,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return Container(
      color: darkMode ? SkyColors.secondary : SkyColors.secondary.shade300,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(24),
          ),
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: leading ?? _leading(context),
            ),
            Expanded(
              child: Text(
                title,
                overflow: overflow,
                maxLines: maxLines,
                style: style ??
                    Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            ...actions,
            const SizedBox(
              width: 12,
            )
          ],
        ),
      ),
    );
  }

  Widget _leading(BuildContext context) => Container(
        decoration: BoxDecoration(
          color:
              darkMode ? SkyColors.secondary.shade800 : SkyColors.mono.shade50,
          shape: BoxShape.circle,
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        padding: const EdgeInsets.all(4),
        alignment: Alignment.center,
        child: InkWell(
          onTap: backAction ?? Navigator.of(context).pop,
          child: Icon(
            Icons.chevron_left_rounded,
            color: darkMode ? Colors.white : Colors.black,
          ),
        ),
      );
}
