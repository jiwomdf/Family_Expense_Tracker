part of 'subcategory_bloc.dart';

sealed class SubcategoryState extends Equatable {
  const SubcategoryState();

  @override
  List<Object> get props => [];
}

final class SubcategoryInitial extends SubcategoryState {}

final class SubcategoryLoading extends SubcategoryState {}

class SubcategoryError extends SubcategoryState {
  final String message;
  const SubcategoryError(this.message);
  @override
  List<Object> get props => [message];
}

class SubcategoryHasData extends SubcategoryState {
  final List<SubCategoryModel> result;
  const SubcategoryHasData(this.result);
  @override
  List<Object> get props => [result];
}

class SubcategoryUpdated extends SubcategoryState {
  const SubcategoryUpdated();
  @override
  List<Object> get props => [];
}
