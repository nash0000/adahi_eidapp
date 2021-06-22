abstract class AdminMeatShopsStates {}

class AdminMeatShopsInitialState extends AdminMeatShopsStates {}

class AdminMeatShopsLoadingState extends AdminMeatShopsStates {}

class AdminMeatShopsSuccessState extends AdminMeatShopsStates {}

class AdminMeatShopsErrorState extends AdminMeatShopsStates {
  final error;
  AdminMeatShopsErrorState(this.error);
}
