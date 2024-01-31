import 'package:comarques/main.dart';
import 'package:flutter/material.dart';
import '../data/api.dart';
import 'package:logger/logger.dart';

class Comarca extends StatelessWidget {
  final int indexProvi;
  
  const Comarca({Key? key, required this.indexProvi}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ComarcaPg(indexProvi: indexProvi),
    );
  }
}

class ComarcaPg extends StatefulWidget {
  final int indexProvi;
  
  const ComarcaPg({Key? key, required this.indexProvi}) : super(key: key);

  @override
  State<ComarcaPg> createState() => _ComarcaPgState();
}

class _ComarcaPgState extends State<ComarcaPg> {
  @override
  Widget build(BuildContext context) {
    Logger logger = Logger();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyApp()));
                logger.i('Click');
          },
        ),
        title: const Text('Comarques'),
      ),
      body: ListView.builder(
        itemCount:
            provincies['provincies'][widget.indexProvi]['comarques'].length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => const Comarca()));
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 120,
                    backgroundImage:
                        
                        Image.network(provincies["provincies"][widget.indexProvi]['comarques'][index]['img']).image,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      provincies["provincies"][widget.indexProvi]['comarques'][index]['comarca'],
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
