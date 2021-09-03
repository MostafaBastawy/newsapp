abstract class NewsAppStates {}

class NewsAppInitialState extends NewsAppStates {}

class NewsAppChangeBottomNavBarState extends NewsAppStates {}

class NewsAppGetBusinessLoadingState extends NewsAppStates {}

class NewsAppGetBusinessSuccessState extends NewsAppStates {}

class NewsAppGetBusinessErrorState extends NewsAppStates {
  final String error;

  NewsAppGetBusinessErrorState(this.error);
}

class NewsAppGetSportsLoadingState extends NewsAppStates {}

class NewsAppGetSportsSuccessState extends NewsAppStates {}

class NewsAppGetSportsErrorState extends NewsAppStates {
  final String error;

  NewsAppGetSportsErrorState(this.error);
}

class NewsAppGetScienceLoadingState extends NewsAppStates {}

class NewsAppGetScienceSuccessState extends NewsAppStates {}

class NewsAppGetScienceErrorState extends NewsAppStates {
  final String error;

  NewsAppGetScienceErrorState(this.error);
}

class NewsAppChangeAppModeState extends NewsAppStates {}
