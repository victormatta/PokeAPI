import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_api/controller/poke_controller.dart';
import 'package:poke_api/model/poke_model.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PokeApp", style: TextStyle(color: Colors.white),),
      backgroundColor: Colors.red.shade600,
      ),
      body: RealPokemon(),
    );
  }
}

class RealPokemon extends GetView<PokeController> {
  @override
  final controller = Get.put(PokeController());

  RealPokemon({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.pokeList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasError) {
            return const Center(child: Text('ERROR'));
          }
          if (snapshot.hasData) {
            final List<Poke> pokemon = snapshot.data as List<Poke>;
            return ListView.builder(
              itemCount: pokemon.length,
              itemBuilder: (context, index) => Card(
                margin: const EdgeInsets.all(7),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 159,
                          width: 150,
                          color: Color.fromARGB(255, 173, 173, 173),
                          child: Image.network(pokemon[index].imageUrl ?? ''),
                        ),
                        const SizedBox(width: 20),
                        Text(pokemon[index].name.toString()),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
          return const Center();
        }
      },
    );
  }
}