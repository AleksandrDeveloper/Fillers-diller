import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../config/api_client.dart';
import '../../modal/category_modal.dart';

part 'all_category_event.dart';
part 'all_category_state.dart';

class AllCategoryBloc extends Bloc<AllCategoryEvent, AllCategoryState> {
  final _client = ApiClient();
  AllCategoryBloc() : super(AllCategoryLoading()) {
    on<AllCategoryEvent>((event, emit) async {
      emit(AllCategoryLoading());
      try {
        final categoryJson = await _client.getCategory();
        emit(AllCategoryLoaded(category: categoryJson));
      } catch (e) {
        emit(const AllCategoryError(errorMassage: 'Что то пошло не так'));
      }
    });
  }
}
