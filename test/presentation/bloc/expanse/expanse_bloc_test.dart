void main() {
  /**
  late ExpenseBloc expenseBloc;
  late MockFirestoreRepository mockFirestoreRepository;
  late InsertExpenseRequest insertExpenseRequest;
  Map<String, dynamic> data = <String, dynamic>{};

  setUp(() {
    mockFirestoreRepository = MockFirestoreRepository();
    expenseBloc = ExpenseBloc(mockFirestoreRepository);
    insertExpenseRequest = InsertExpenseRequest(
      note: "odol",
      price: 22200,
      date: "14/08/2024",
      categoryName: "primary needs",
      subCategoryName: "skincare",
    );
  });


  blocTest<ExpenseBloc, ExpenseState>(
    'Should emit [ExpenseDataChanged] when data is inserted successfully',
    build: () {
      data[ExpenseConstants.email] = "";
      data[ExpenseConstants.note] = "odol";
      data[ExpenseConstants.price] = 22200;
      data[ExpenseConstants.date] = "14/08/2024";
      data[ExpenseConstants.categoryName] = "primary needs";
      data[ExpenseConstants.subCategoryName] = "skincare";
      data[ExpenseConstants.year] = "2024";
      data[ExpenseConstants.month] = "08";
      data[ExpenseConstants.dayOfMonth] = "14";
      data[ExpenseConstants.timeStamp] = "00:20:46 01/09/2024";
      data[ExpenseConstants.status] = "A";

      when(mockFirestoreRepository.insertExpense(data))
          .thenAnswer((_) async => const Right(null));
      return expenseBloc;
    },
    act: (bloc) => bloc.add(InsertExpenseEvent(insertExpenseRequest)),
    expect: () => [],
    verify: (bloc) {
      verify(mockFirestoreRepository.insertExpense(data));
      return InsertExpenseEvent(insertExpenseRequest).props;
    },
  );


  blocTest<ExpenseBloc, ExpenseState>(
    'Should emit [ExpenseDataChanged] when data is updated successfully',
    build: () {
      when(mockFirestoreRepository.updateExpense(
        id: updateExpenseRequest.id,
        note: updateExpenseRequest.categoryName,
        price: updateExpenseRequest.price,
        date: updateExpenseRequest.date,
        categoryName: updateExpenseRequest.categoryName,
        subCategoryName: updateExpenseRequest.subCategoryName,
      )).thenAnswer((_) async => const Right(null));
      return expenseBloc;
    },
    act: (bloc) => bloc.add(UpdateExpenseEvent(updateExpenseRequest)),
    expect: () => [
      const ExpenseDataChanged(true),
    ],
    verify: (bloc) {
      verifyNever(mockFirestoreRepository.updateExpense(
        id: updateExpenseRequest.id,
        note: updateExpenseRequest.categoryName,
        price: updateExpenseRequest.price,
        date: updateExpenseRequest.date,
        categoryName: updateExpenseRequest.categoryName,
        subCategoryName: updateExpenseRequest.subCategoryName,
      ));
      return UpdateExpenseEvent(updateExpenseRequest).props;
    },
  ); **/
}
