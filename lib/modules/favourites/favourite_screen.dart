import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/data/models/product/product.dart';
import 'package:grocery_nepal/modules/favourites/favorite_controller.dart';
import 'package:grocery_nepal/modules/prdouct_detail/prdocut_detail_screen.dart';
import 'package:grocery_nepal/widgets/loading.dart';

class FavouriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourites'),
      ),
      body: GetBuilder<FavoriteController>(builder: (controller) {
        return controller.favorites.isEmpty
            ? Center(
                child: Text('You have no favorites'),
              )
            : ListView.builder(
                itemCount: controller.favorites.length,
                itemBuilder: (context, index) => Card(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: ListTile(
                      onTap: () {
                        Get.to(() => ProductDetailScreen(),
                            arguments: controller.favorites[index]);
                      },
                      leading: SizedBox(
                        height: 20,
                        width: 20,
                        child: CachedNetworkImage(
                          imageUrl:
                              imageUrl + controller.favorites[index].image,
                          placeholder: (context, url) => Loading(
                            size: 50,
                          ),
                          errorWidget: (context, url, error) =>
                              Image.asset('assets/images/cabbage.png'),
                        ),
                      ),
                      title: Text(controller.favorites[index].name),
                      trailing: IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text(
                                        'Are you sure you want to remove this item?'),
                                    content: Text('Yes'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Cancel')),
                                      TextButton(
                                          onPressed: () {
                                            controller.removeFavorites(
                                                controller.favorites[index]);
                                            Navigator.pop(context);
                                          },
                                          child: Text('Remove'))
                                    ],
                                  ));
                        },
                        icon: Icon(Icons.delete_outline),
                      ),
                    ),
                  ),
                ),
              );
      }),
    );
  }
}
