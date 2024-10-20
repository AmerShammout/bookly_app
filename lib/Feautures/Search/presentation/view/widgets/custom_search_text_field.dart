import 'package:bookly_app/Feautures/Search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (searchText) {
        BlocProvider.of<SearchBooksCubit>(context).fetchRequestedBooks(
          searchText: searchText,
        );
      },
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {},
          icon: Opacity(
            opacity: .8,
            child: SvgPicture.asset(
              Assets.imagesSearch,
            ),
          ),
        ),
        labelText: 'Search',
        labelStyle: AppStyles.styleMedium16(context).copyWith(
          color: Colors.white,
        ),
        contentPadding: const EdgeInsets.all(16),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: Colors.white,
        ),
      );
}
