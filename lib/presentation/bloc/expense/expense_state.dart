part of 'expense_bloc.dart';

sealed class ExpenseState extends Equatable {
  const ExpenseState();

  @override
  List<Object> get props => [];
}

final class ExpenseInitiated extends ExpenseState {}

final class ExpenseLoading extends ExpenseState {}

class ExpenseError extends ExpenseState {
  final String message;
  const ExpenseError(this.message);
  @override
  List<Object> get props => [message];
}

class ExpenseHasData extends ExpenseState {
  final List<ExpenseCategoryModel> result;
  const ExpenseHasData(this.result);
  @override
  List<Object> get props => [result];
}

class ExpenseDataChanged extends ExpenseState {
  final bool isSuccess;
  const ExpenseDataChanged(this.isSuccess);
  @override
  List<Object> get props => [isSuccess];
}

class ExpenseEmpty extends ExpenseState {
  const ExpenseEmpty();
  @override
  List<Object> get props => [];
}
