import 'package:flutter/material.dart';
import 'package:skywatch/colors.dart';
import 'package:skywatch/pages/utils.dart';

class SkyWatchTextField extends StatefulWidget {
  const SkyWatchTextField({
    super.key,
    required this.controller,
    required this.label,
    this.enabled = true,
  });

  final TextEditingController controller;
  final String label;
  final bool enabled;

  @override
  State<SkyWatchTextField> createState() => _SkyWatchTextFieldState();
}

class _SkyWatchTextFieldState extends State<SkyWatchTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      cursorColor: SkyColors.secondary,
      enabled: widget.enabled,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        label: Text(widget.label),
        filled: true,
        fillColor: darkMode ? SkyColors.secondary.shade900 : SkyColors.mono[0],
        focusColor: SkyColors.primary,
        labelStyle: Theme.of(context).textTheme.bodyMedium,
        border: OutlineInputBorder(
          borderRadius: defaultBorderRadius,
          borderSide: BorderSide(
            color: SkyColors.primary.shade500,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: defaultBorderRadius,
          borderSide: BorderSide(
            color: SkyColors.primary.shade500,
          ),
        ),
      ),
    );
  }
}
