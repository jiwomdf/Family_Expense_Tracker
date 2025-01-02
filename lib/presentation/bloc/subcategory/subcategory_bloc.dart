import 'package:bloc/bloc.dart';
import 'package:core/domain/model/sub_category_model.dart';
import 'package:core/repository/firestore_repository.dart';
import 'package:equatable/equatable.dart';

part 'subcategory_event.dart';
part 'subcategory_state.dart';

class SubcategoryBloc extends Bloc<SubcategoryEvent, SubcategoryState> {
  final FirestoreRepository _firestoreRepository;

  SubcategoryBloc(this._firestoreRepository) : super(SubcategoryInitial()) {
    on<GetSubcategoryEvent>((event, emit) async {
      emit(SubcategoryLoading());
      final result = await _firestoreRepository.getSubCategory();
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
      final result = await _firestoreRepository.getSubCategoryWithCache();
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
      final result = await _firestoreRepository.updateSubCategory(
          subCategoryId: event.subCategoryModel.subCategoryId,
          categoryName: event.subCategoryModel.subCategoryName,
          categoryColor: event.subCategoryModel.subCategoryColor);
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
