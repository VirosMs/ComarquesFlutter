import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class ComarcaInfo extends StatefulWidget {
  final Map args;

  const ComarcaInfo({Key? key, required this.args}) : super(key: key);

  @override
  State<ComarcaInfo> createState() => _ComarcaInfoState();
}

class _ComarcaInfoState extends State<ComarcaInfo> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    Logger logger = Logger();
    Map? comarca = widget.args['comarca'] as Map?;
    logger.i('comarca: $comarca');

    if (comarca == null) {
      return const Text('Error 404');
    } else {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
              logger.i('Click');
            },
          ),
          title: Text(comarca['comarca']),
          backgroundColor: Colors.transparent.withOpacity(0),
        ),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          indicatorColor: Colors.amber,
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.info),
              icon: Icon(Icons.info_outline),
              label: 'Info',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.sunny),
              icon: Icon(Icons.cloud),
              label: 'Tiempo',
            ),
          ],
        ),
        body: <Widget>[
          // Aquí va el contenido de la página de Info
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  AspectRatio(
                    aspectRatio: MediaQuery.of(context).size.width / 250,
                    child: Image.network(
                      comarca['img'],
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    comarca['comarca'],
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Capital: ${comarca['capital']}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      //color: Colors.black.withOpacity(0.5),
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    comarca['desc'],
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
            ),
          ),
          // Aquí va el contenido de la página de Tiempo
          const Center(
              child: Text('Aquí va el contenido de la página de Tiempo')),
        ][currentPageIndex],
      );
    }
  }
}
