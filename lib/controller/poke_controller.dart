import 'package:get/get.dart';
import 'package:poke_api/model/poke_model.dart';
import 'package:poke_api/repository/poke_repository.dart';

class PokeController extends GetxController {
  PokeRepository repository = PokeRepository();
  Future<List<Poke>> pokeList() async => await repository.getPokeList();

}