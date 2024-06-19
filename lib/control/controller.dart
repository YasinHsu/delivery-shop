import 'package:lalezar/model/model.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  Repository repository = Repository();
  RxBool loading = false.obs;
  List products = [].obs;

  Controller() {
    loadFromApiRepo();
  }

  loadFromApiRepo() async{
    loading(true);
    products = await repository.loadFromApi();
    loading(false);
  }
}