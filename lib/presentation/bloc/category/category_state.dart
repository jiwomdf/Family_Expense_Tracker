part of 'category_bloc.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

final class CategoryLoading extends CategoryState {}

class CategoryError extends CategoryState {
  final String message;
  const CategoryError(this.message);
  @override
  List<Object> get props => [message];
}

class CategoryHasData extends CategoryState {
  final List<CategoryModel> result;
  const CategoryHasData(this.result);
  @override
  List<Object> get props => [result];
}

class CategoryUpdated extends CategoryState {
  const CategoryUpdated();
  @override
  List<Object> get props => [];
}

class CategoryEmpty extends CategoryState {
  const CategoryEmpty();
  @override
  List<Object> get props => [];
}
