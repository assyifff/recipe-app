import 'package:flutter/material.dart';
import 'package:recipe_app/UI/view/style/color_style.dart';
import 'package:recipe_app/UI/view/widget/home_widget/show_recipe_trending_widget.dart';
import 'package:recipe_app/UI/view_model/recipe_trending_provider.dart';

class BuildTrendingWidget extends StatelessWidget {
  const BuildTrendingWidget({
    super.key,
    required this.colorStyle,
    required this.trendingProvider,
  });

  final ColorStyle colorStyle;
  final RecipeTrendingProvider trendingProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Trending now 🔥',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              InkWell(
                child: Row(
                  children: [
                    Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: colorStyle.base,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_rounded,
                      color: colorStyle.base,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        ShowRecipeTrendingWidget(
            trendingProvider: trendingProvider, colorStyle: colorStyle),
      ],
    );
  }
}
