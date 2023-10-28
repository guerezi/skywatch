import 'package:flutter/material.dart';
import 'package:skywatch/colors.dart';
import 'package:skywatch/pages/utils.dart';

class SkywatchButton extends StatelessWidget {
  const SkywatchButton({
    super.key,
    required this.callback,
    required this.title,
    this.active = true,
  });

  final VoidCallback callback;
  final String title;
  final bool active;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: active ? callback : null,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: defaultBorderRadius,
            color: darkMode ? SkyColors.primary : SkyColors.secondary,
          ),
          foregroundDecoration: !active
              ? BoxDecoration(
                  color: SkyColors.mono.shade100.withOpacity(0.4),
                  borderRadius: defaultBorderRadius,
                )
              : null,
          padding: defaultPaddingLarge,
          margin: defaultPadding,
          child: Text(
            title,
            style: Theme.of(context).textTheme.displaySmall?.apply(
                  color: darkMode
                      ? SkyColors.mono.shade50
                      : SkyColors.mono.shade900,
                ),
          ),
        ),
      );
}
