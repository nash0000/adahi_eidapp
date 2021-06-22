abstract class AddMeatStates {}

class AddMeatInitialState extends AddMeatStates {}

class AddMeatLoadingState extends AddMeatStates {}

class AddMeatSuccessState extends AddMeatStates {}

class AddMeatErrorState extends AddMeatStates {
  final error;
  AddMeatErrorState(this.error);
}
