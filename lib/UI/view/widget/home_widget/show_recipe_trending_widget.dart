import 'package:flutter/material.dart';
import 'package:recipe_app/UI/view/style/color_style.dart';
import 'package:recipe_app/UI/view_model/recipe_trending_provider.dart';

class ShowRecipeTrendingWidget extends StatelessWidget {
  const ShowRecipeTrendingWidget({
    super.key,
    required this.trendingProvider,
    required this.colorStyle,
  });

  final RecipeTrendingProvider trendingProvider;
  final ColorStyle colorStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: trendingProvider.trendings.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Stack(
                        children: [
                          Container(
                            height: 180,
                            width: 280,
                            decoration: BoxDecoration(
                              color: colorStyle.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          SizedBox(
                            width: 280,
                            height: 180,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                trendingProvider.trendings[index].image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  width: 58,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    color: colorStyle.rating.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 4),
                                      Icon(
                                        Icons.star,
                                        color: colorStyle.white,
                                      ),
                                      const SizedBox(width: 2),
                                      Text(
                                        trendingProvider
                                            .trendings[index].rating,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: colorStyle.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'How to make ${trendingProvider.trendings[index].title}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'By ${trendingProvider.trendings[index].user}',
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 16);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
