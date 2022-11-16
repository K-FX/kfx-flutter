part of "k_a_scaffold.dart";

abstract class _KAScaffoldBase extends StatelessWidget {
  const _KAScaffoldBase({
    required this.title,
    required this.child,
    this.actions,
    super.key,
  });

  final String title;
  final Widget child;
  final List<Widget>? actions;
}
