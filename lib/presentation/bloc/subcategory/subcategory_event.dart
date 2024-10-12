part of 'subcategory_bloc.dart';

sealed class SubcategoryEvent extends Equatable {
  const SubcategoryEvent();

  @override
  List<Object> get props => [];
}

class ResetSubcategoryEvent extends SubcategoryEvent {
  const ResetSubcategoryEvent();

  @override
  List<Object> get props => [];
}

class UpdateSubcategoryEvent extends SubcategoryEvent {
  final SubCategoryModel subCategoryModel;

  const UpdateSubcategoryEvent(this.subCategoryModel);

  @override
  List<Object> get props => [];
}

class GetSubcategoryEvent extends SubcategoryEvent {
  const GetSubcategoryEvent();

  @override
  List<Object> get props => [];
}

class GetSubcategoryWithCacheEvent extends SubcategoryEvent {
  const GetSubcategoryWithCacheEvent();

  @override
  List<Object> get props => [];
}
