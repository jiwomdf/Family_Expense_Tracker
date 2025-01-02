import 'package:bloc_test/bloc_test.dart';
import 'package:core/domain/model/category_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:group_expense_tracker/presentation/bloc/category/category_bloc.dart';
import 'package:mockito/mockito.dart';

import '../../../helper/dummy_items.dart';
import '../../../helper/test_helper.mocks.dart';

void main() {
  late CategoryBloc categoryBloc;
  late MockFirestoreRepository mockFirestoreRepository;
  late CategoryModel categoryModel;

  setUp(() {
    mockFirestoreRepository = MockFirestoreRepository();
    categoryBloc = CategoryBloc(mockFirestoreRepository);

    categoryModel = CategoryModel(
      categoryId: "1",
      categoryColor: 0xFFFFFFFF,
      categoryName: "Groceries",
    );
  });

  blocTest<CategoryBloc, CategoryState>(
    'Should emit [UpdateCategoryEvent] when data is updated successfully',
    build: () {
      when(mockFirestoreRepository.updateCategory(
              categoryName: categoryModel.categoryName,
              categoryColor: categoryModel.categoryColor))
          .thenAnswer((_) async => const Right(null));
      return categoryBloc;
    },
    act: (bloc) => bloc.add(UpdateCategoryEvent(categoryModel)),
    expect: () => [
      const CategoryUpdated(),
    ],
    verify: (bloc) {
      verify(mockFirestoreRepository.updateCategory(
          categoryName: categoryModel.categoryName,
          categoryColor: categoryModel.categoryColor));
      return UpdateCategoryEvent(categoryModel).props;
    },
  );

  blocTest<CategoryBloc, CategoryState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockFirestoreRepository.getCategory())
          .thenAnswer((_) async => Right([testCategory]));
      return categoryBloc;
    },
    act: (bloc) => bloc.add(const GetCategoryEvent()),
    expect: () => [
      CategoryLoading(),
      CategoryHasData([testCategory]),
    ],
    verify: (bloc) {
      verify(mockFirestoreRepository.getCategory());
      return const GetCategoryEvent().props;
    },
  );
}
