part of 'category_bloc.dart';

sealed class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class ResetCategoryEvent extends CategoryEvent {
  const ResetCategoryEvent();

  @override
  List<Object> get props => [];
}

class UpdateCategoryEvent extends CategoryEvent {
  final CategoryModel categoryModel;

  const UpdateCategoryEvent(this.categoryModel);

  @override
  List<Object> get props => [];
}

class GetCategoryEvent extends CategoryEvent {
  const GetCategoryEvent();

  @override
  List<Object> get props => [];
}
