abstract class AdminPageStates {}

class AdminPageInitialState extends AdminPageStates {}

class AdminPageLoadingState extends AdminPageStates {}

class AdminPageSuccessState extends AdminPageStates {}

class AdminPageErrorState extends AdminPageStates {
  final error;
  AdminPageErrorState(this.error);
}
