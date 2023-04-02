import 'package:book_app/core/utils/styles.dart';
import 'package:book_app/core/utils/widgets/custom_button.dart';
import 'package:book_app/features/home/presentation/views/widgets/booking_rating.dart';
import 'package:book_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

import 'books_action.dart';
import 'custom_book_details_app_bar.dart';
import 'similar_books_list_view.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              CustomBookDetailsAppBar(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * .2),
                child: CustomBookImage(),
              ),
              SizedBox(
                height: 43,
              ),
              Text(
                'Fortress Blood',
                style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 6,
              ),
              Opacity(
                opacity: .7,
                child: Text(
                  'LD Goffiggan',
                  style: Styles.textStyle18.copyWith(
                      fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              const BookRating(
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              const SizedBox(
                height: 37,
              ),
              const BookAction(),
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'You can also like',
                  style:
                      Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SimilarBooksListview()
            ],
          ),
        ),
      ),
    );
  }
}

