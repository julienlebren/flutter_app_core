part of layout_builder;

class Loader extends StatelessWidget {
  const Loader({
    super.key,
    this.delayBeforeDisplay = 1,
  });

  final int delayBeforeDisplay;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: delayBeforeDisplay), () {}),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class ScaffoldLoader extends StatelessWidget {
  const ScaffoldLoader({
    super.key,
    this.delayBeforeDisplay = 1,
  });

  final int delayBeforeDisplay;

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: Loader(
        delayBeforeDisplay: delayBeforeDisplay,
      ),
    );
  }
}
