abstract class MeatDetailStates {}

class MeatDetailInitialState extends MeatDetailStates {}

class MeatDetailLoadingState extends MeatDetailStates {}

class MeatDetailSuccessState extends MeatDetailStates {}

class MeatDetailErrorState extends MeatDetailStates {
  final error;
  MeatDetailErrorState(this.error);
}
