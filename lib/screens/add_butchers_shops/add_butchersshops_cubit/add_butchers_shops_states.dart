abstract class AddButchersShopStates {}

class AddButchersShopInitialState extends AddButchersShopStates {}

class AddButchersShopLoadingState extends AddButchersShopStates {}

class AddButchersShopSuccessState extends AddButchersShopStates {}

class AddButchersShopErrorState extends AddButchersShopStates {
  final error;
  AddButchersShopErrorState(this.error);
}

class AddButchersShopMeatTypeState extends AddButchersShopStates {}
