import 'package:flutter/material.dart';

import '../k_platform_builder.dart';

part 'k_a_scaffold_android.dart';
part 'k_a_scaffold_base.dart';
part 'k_a_scaffold_ios.dart';

class KAScaffold extends StatelessWidget {
  const KAScaffold({
    required this.title,
    required this.child,
    this.actions,
    super.key,
  });

  final String title;
  final Widget child;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return KPlatformBuilder(
      iosBuilder: (context, platformInfo) => const _KAScaffoldiOS(),
      androidBuilder: (context, platformInfo) => _KAScaffoldAndroid(title: title, actions: actions, child: child),
    );
  }
}
