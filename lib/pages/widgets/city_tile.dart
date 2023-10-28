import 'package:flutter/material.dart';
import 'package:skywatch/colors.dart';
import 'package:skywatch/domain/models/location.dart';
import 'package:skywatch/pages/utils.dart';

class CityTile extends StatelessWidget {
  const CityTile({super.key, required this.location, this.callback});

  final Location location;
  final VoidCallback? callback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: darkMode ? SkyColors.mono.shade900 : SkyColors.mono.shade50,
          borderRadius: defaultBorderRadius,
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  location.name,
                  style: Theme.of(context).textTheme.bodyLarge?.apply(
                        color: darkMode ? Colors.white : Colors.black,
                      ),
                ),
                Text(
                  "${location.state} - ${location.country}",
                  style: Theme.of(context).textTheme.labelSmall?.apply(
                        color: darkMode
                            ? SkyColors.mono.shade50
                            : SkyColors.secondary.shade900,
                      ),
                ),
              ],
            ),
            const Spacer(),
            const Icon(Icons.chevron_right_rounded)
          ],
        ),
      ),
    );
  }
}
