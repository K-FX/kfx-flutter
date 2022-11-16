part of "k_a_scaffold.dart";

class _KAScaffoldAndroid extends _KAScaffoldBase {
  const _KAScaffoldAndroid({required super.title, required super.child, super.actions, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), actions: actions),
      body: child,
    );
  }
}
