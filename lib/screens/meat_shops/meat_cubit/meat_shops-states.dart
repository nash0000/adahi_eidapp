abstract class MeatShopsStates {}

class MeatShopsInitialState extends MeatShopsStates {}

class MeatShopsLoadingState extends MeatShopsStates {}

class MeatShopsSuccessState extends MeatShopsStates {}

class MeatShopsErrorState extends MeatShopsStates {
  final error;
  MeatShopsErrorState(this.error);
}
