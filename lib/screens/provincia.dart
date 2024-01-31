import 'package:comarques/main.dart';
import 'package:comarques/screens/comarca.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import '../data/api.dart';

void main() => runApp(const Provincia());

class Provincia extends StatelessWidget {
  const Provincia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProvinciaPg(),
    );
  }
}

class ProvinciaPg extends StatefulWidget {
  const ProvinciaPg({Key? key}) : super(key: key);

  @override
  State<ProvinciaPg> createState() => _ProvinciaPgState();
}

class _ProvinciaPgState extends State<ProvinciaPg> {
  @override
  Widget build(BuildContext context) {
    Logger logger = Logger();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const MyApp()));
          },
        ),
        title: const Text('Provincias'),
        
      ),
      body: ListView.builder(
        itemCount: provincies['provincies'].length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                logger.i('Click');
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) =>  Comarca(indexProvi: index)));
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 120,
                    backgroundImage:
                    // if index == 0, then use this image URL instead of the one from the API call
                        Image.network(index == 0 ? 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Townhall_of_Valencia.jpg/800px-Townhall_of_Valencia.jpg' : provincies['provincies'][index]['img'])
                          .image,
                  ),
                  CircleAvatar(
                    radius: 125,
                    backgroundColor: Colors.black.withOpacity(0.1), 
                  ),
                  Text(
                    provincies['provincies'][index]['provincia'] ,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  
                ], // Added closing parenthesis
              ),
            ), // Added closing parenthesis
          ); // Added semicolon
        }, // Added closing parenthesis
      ), // Added closing parenthesis
    );
  }
}
