abstract class UserMeatShopsStates {}

class UserMeatShopsInitialState extends UserMeatShopsStates {}

class UserMeatShopsLoadingState extends UserMeatShopsStates {}

class UserMeatShopsSuccessState extends UserMeatShopsStates {}

class UserMeatShopsErrorState extends UserMeatShopsStates {
  final error;
  UserMeatShopsErrorState(this.error);
}
