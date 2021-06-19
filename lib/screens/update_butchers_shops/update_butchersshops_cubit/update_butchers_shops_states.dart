abstract class UpdateButchersShopStates {}

class UpdateButchersShopInitialState extends UpdateButchersShopStates {}

class UpdateButchersShopLoadingState extends UpdateButchersShopStates {}

class UpdateButchersShopSuccessState extends UpdateButchersShopStates {}

class UpdateButchersShopErrorState extends UpdateButchersShopStates {
  final error;
  UpdateButchersShopErrorState(this.error);
}
