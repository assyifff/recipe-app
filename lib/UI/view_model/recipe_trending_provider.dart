import 'package:flutter/foundation.dart';
import 'package:recipe_app/core/model/recipe_trending_model.dart';

class RecipeTrendingProvider extends ChangeNotifier {
  final List<RecipeTrendingModel> trendings = [
    const RecipeTrendingModel(
        title: 'Fruit Sando',
        user: 'nisanamisae',
        rating: '4,6',
        image: 'assets/image/fruit_sando.jpg'),
    const RecipeTrendingModel(
        title: 'Japanese Miso Soup',
        user: 'endangharyanti',
        rating: '4,7',
        image: 'assets/image/miso_soup.jpg'),
    const RecipeTrendingModel(
        title: 'Tomyam Udang',
        user: 'kekoristi',
        rating: '4,9',
        image: 'assets/image/tomyam_udang.jpg'),
    const RecipeTrendingModel(
        title: 'Carbonara Udon',
        user: 'angelinehosen',
        rating: '4,8',
        image: 'assets/image/carbonara_udon.jpg'),
  ];
}
