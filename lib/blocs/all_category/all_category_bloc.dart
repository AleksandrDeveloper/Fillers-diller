import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../api_client/api_client.dart';
import '../../modal/category_modal.dart';

part 'all_category_event.dart';
part 'all_category_state.dart';

class AllCategoryBloc extends Bloc<AllCategoryEvent, AllCategoryState> {
  AllCategoryBloc() : super(AllCategoryLoading()) {
    List<CategoryProduct> category;
    final client = ApiClient();
    on<AllCategoryEvent>((event, emit) async {
      emit(AllCategoryLoading());
      try {
        final categoryJson = await client.getCategory();

        emit(AllCategoryLoaded(category: categoryJson));
      } catch (e) {
        emit(AllCategoryError(errorMassage: 'Что то пошло не так'));
      }
    });
  }
}
