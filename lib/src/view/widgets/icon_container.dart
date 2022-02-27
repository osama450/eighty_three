import 'package:flutter/material.dart';
import '../utils/app_theme.dart';


class IconContainer extends StatelessWidget {
  final Widget icon;

  const IconContainer({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: AppTheme.containerIconBackground,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(child: icon),
    );
  }
}
