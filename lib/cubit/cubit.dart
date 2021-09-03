import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/states.dart';
import 'package:newsapp/screens/business_screen.dart';
import 'package:newsapp/screens/science_screen.dart';
import 'package:newsapp/screens/sports_screen.dart';
import 'package:newsapp/shared/cache_helper.dart';
import 'package:newsapp/shared/dio_helper.dart';

class NewsAppCubit extends Cubit<NewsAppStates> {
  NewsAppCubit() : super(NewsAppInitialState());

  static NewsAppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
  ];
  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];
  List<String> titles = [];

  void changeBottomNavBar(int value) {
    currentIndex = value;
    emit(NewsAppChangeBottomNavBarState());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsAppGetBusinessLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apikey': '4974fc8a585143c2a18c4976f8175050',
      },
    ).then((value) {
      print(value.toString());
      business = value.data['articles'];
      print(business.length);
      emit(NewsAppGetBusinessSuccessState());
    }).catchError((error) {
      emit(NewsAppGetBusinessErrorState(error.toString()));
      print(error.toString());
    });
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(NewsAppGetSportsLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'sports',
        'apikey': '4974fc8a585143c2a18c4976f8175050',
      },
    ).then((value) {
      print(value.toString());
      sports = value.data['articles'];
      print(sports.length);
      emit(NewsAppGetSportsSuccessState());
    }).catchError((error) {
      emit(NewsAppGetSportsErrorState(error.toString()));
      print(error.toString());
    });
  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewsAppGetScienceLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'science',
        'apikey': '4974fc8a585143c2a18c4976f8175050',
      },
    ).then((value) {
      print(value.toString());
      science = value.data['articles'];
      print(science.length);
      emit(NewsAppGetScienceSuccessState());
    }).catchError((error) {
      emit(NewsAppGetScienceErrorState(error.toString()));
      print(error.toString());
    });
  }

  bool isDark = false;
  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      //emit(NewsAppChangeAppModeState());
    } else {
      isDark = !isDark;
      CacheHelper.setData(key: "isDark", value: isDark).then((value) {
        emit(NewsAppChangeAppModeState());
      });
    }
  }
}
