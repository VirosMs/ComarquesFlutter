import 'package:comarques/data/api.dart';
import 'package:flutter/cupertino.dart';


class ComarcaInfo extends StatelessWidget {

  const ComarcaInfo(
      {Key? key}): super(key: key);

      

  @override
  Widget build(BuildContext context) {
  final Map args = ModalRoute.of(context)?.settings.arguments as Map;
  var comarca = args['comarques'];

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Comarca Info'),
      ),
      child: Center(
        child: CupertinoButton(
          child: Text(comarca['comarca']),
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => const SecondRoute()),
            );
          },
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Second Route'),
      ),
      child: Center(
        child: CupertinoButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
