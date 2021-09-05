import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/cubit.dart';
import 'package:newsapp/cubit/states.dart';
import 'package:newsapp/shared/components.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit, NewsAppStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        NewsAppCubit cubit = NewsAppCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                  controller: searchController,
                  labelText: 'Search',
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'search must not be empty';
                    }
                    return null;
                  },
                  prefixIcon: Icons.search,
                  onChange: (value) {
                    cubit.getSearch(value);
                  },
                  onSubmit: () {},
                  onTap: () {},
                  type: TextInputType.text,
                ),
              ),
              ConditionalBuilder(
                condition: (cubit.search.isNotEmpty),
                builder: (BuildContext context) {
                  return Expanded(
                    child: articleBuilder(
                      cubit.search,
                      context,
                    ),
                  );
                },
                fallback: (BuildContext context) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
