import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/cubit.dart';
import 'package:newsapp/cubit/states.dart';
import 'package:newsapp/shared/components.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit, NewsAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        NewsAppCubit cubit = NewsAppCubit.get(context);
        return ConditionalBuilder(
          condition: state is! NewsAppGetBusinessLoadingState,
          builder: (context) => ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) =>
                buildArticleItem(cubit.business[index], context),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: cubit.business.length,
          ),
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
