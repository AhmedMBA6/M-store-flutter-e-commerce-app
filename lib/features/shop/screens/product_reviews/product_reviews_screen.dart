import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/common/widgets/appbar/appbar.dart';
import 'package:flutter_splash_test1/common/widgets/products/rating/rating_indecator.dart';
import 'package:flutter_splash_test1/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:flutter_splash_test1/utils/constants/sizes.dart';

import 'widgets/rating_progress_indecator.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// -- AppBar
      appBar: const MAppbar(
        title: Text("Reviews & Ratings"),
        showBackArrow: true,
      ),

      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  "Reviews and ratings are verified and from people who use the same product"),
              const SizedBox(
                height: MSizes.spaceBetweenItems,
              ),

              /// -- Overall Product Ratings
              const MOverallProductRating(),
              const MRatingBarIndicator(rating: 4),
              Text("10,000", style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(
                height: MSizes.spaceBetweenSections,
              ),

              /// -- User Reviews List
              const UserReviewCard(
                userName: "Talha Bauiomy",
                userComment:
                    "That brand is so beauty, and the suer interface of the app is quite intuitive",
                companyName: "M's Store",
                companyComment:
                    "Thank you very much for your comment, and we pleasure to have your attention, and Our aims keep you safe and enjoying use our services",
              ),
              const UserReviewCard(
                userName: "Yahia Bauiomy",
                userComment:
                    "That brand is so beauty, and the suer interface of the app is quite intuitive",
                companyName: "M's Store",
                companyComment:
                    "Thank you very much for your comment, and we pleasure to have your attention, and Our aims keep you safe and enjoying use our services",
              ),
              const UserReviewCard(
                userName: "Ahmed Eisa",
                userComment:
                    "That brand is so beauty, and the suer interface of the app is quite intuitive",
                companyName: "M's Store",
                companyComment:
                    "Thank you very much for your comment, and we pleasure to have your attention, and Our aims keep you safe and enjoying use our services",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
