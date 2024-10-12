import 'package:bloc/bloc.dart';
import 'package:core/domain/model/sub_category_model.dart';
import 'package:core/repository/firestore_repository.dart';
import 'package:equatable/equatable.dart';

part 'subcategory_event.dart';
part 'subcategory_state.dart';

class SubcategoryBloc extends Bloc<SubcategoryEvent, SubcategoryState> {
  final FirestoreRepository firestoreRepository;

  SubcategoryBloc(this.firestoreRepository) : super(SubcategoryInitial()) {
    on<GetSubcategoryEvent>((event, emit) async {
      emit(SubcategoryLoading());
      final result = await firestoreRepository.getSubCategory();
      result.fold(
        (failure) {
          emit(SubcategoryError(failure.message));
        },
        (data) {
          emit(SubcategoryHasData(data));
        },
      );
    });

    on<GetSubcategoryWithCacheEvent>((event, emit) async {
      emit(SubcategoryLoading());
      final result = await firestoreRepository.getSubCategoryWithCache();
      result.fold(
        (failure) {
          emit(SubcategoryError(failure.message));
        },
        (data) {
          emit(SubcategoryHasData(data));
        },
      );
    });

    on<UpdateSubcategoryEvent>((event, emit) async {
      emit(SubcategoryLoading());
      final result = await firestoreRepository.updateSubCategory(
          categoryName: event.subCategoryModel.categoryName,
          categoryColor: event.subCategoryModel.categoryColor);
      result.fold(
        (failure) {
          emit(SubcategoryError(failure.message));
        },
        (data) {
          emit(const SubcategoryUpdated());
        },
      );
    });
  }
}
