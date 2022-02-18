import 'package:get/get.dart';
import 'package:grocery_nepal/data/api/local/favorite_local.dart';
import 'package:grocery_nepal/data/models/product/product.dart';

class FavoriteController extends GetxController {
  List<Product> favorites = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getFavorites();
  }

  Future<void> getFavorites() async {
    favorites = await FavoriteLocal.get();
    update();
  }

  void addFavorites(Product product) {
    favorites.add(product);
    FavoriteLocal.set(favorites);
    update();
  }

  void removeFavorites(Product product) {
    favorites.removeWhere((element) => element.id == product.id);
    FavoriteLocal.set(favorites);
    update();
  }
}
