import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DefaultIconButton extends StatelessWidget {
  const DefaultIconButton({
    this.onPressed,
    this.label = const Text(''),
    this.icon = Icons.add,
  });

  final Widget label;
  final VoidCallback? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) => ElevatedButton.icon(
        onPressed: onPressed,
        label: label,
        icon: Icon(icon),
      );
}
