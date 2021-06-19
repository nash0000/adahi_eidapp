import 'package:adahi_eidapp/models/butcher_model.dart';
import 'package:adahi_eidapp/screens/search_screen/cubit/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  getSearch(String shop) {
    emit(SearchLoadingState());
  }
}
