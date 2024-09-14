import 'package:bloc_test/bloc_test.dart';
import 'package:core/domain/model/sub_category_model.dart';
import 'package:dartz/dartz.dart';
import 'package:family_expense_tracker/presentation/bloc/subcategory/subcategory_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helper/test_helper.mocks.dart';

void main() {
  late SubcategoryBloc registerBloc;
  late MockFirestoreRepository mockFirestoreRepository;
  late List<SubCategoryModel> subCategoryList;
  late SubCategoryModel subCategoryModel;
  const categoryName = "categoryName";
  const categoryColor = 0;

  setUp(() {
    mockFirestoreRepository = MockFirestoreRepository();
    registerBloc = SubcategoryBloc(mockFirestoreRepository);
    subCategoryModel =
        SubCategoryModel(categoryName: 'categoryName', categoryColor: 0);
    subCategoryList = [SubCategoryModel(categoryName: '', categoryColor: 0)];
  });

  blocTest<SubcategoryBloc, SubcategoryState>(
    'Should emit [GetSubcategoryEvent] when data is get successfully',
    build: () {
      when(mockFirestoreRepository.getSubCategory())
          .thenAnswer((_) async => Right(subCategoryList));
      return registerBloc;
    },
    act: (bloc) => bloc.add(const GetSubcategoryEvent()),
    expect: () => [
      SubcategoryLoading(),
      SubcategoryHasData(subCategoryList),
    ],
    verify: (bloc) {
      verify(mockFirestoreRepository.getSubCategory());
      return const GetSubcategoryEvent().props;
    },
  );

  blocTest<SubcategoryBloc, SubcategoryState>(
    'Should emit [UpdateSubcategoryEvent] when data is updated successfully',
    build: () {
      when(mockFirestoreRepository.updateSubCategory(
              categoryName: categoryName, categoryColor: categoryColor))
          .thenAnswer((_) async => const Right(null));
      return registerBloc;
    },
    act: (bloc) => bloc.add(UpdateSubcategoryEvent(subCategoryModel)),
    expect: () => [
      SubcategoryLoading(),
      const SubcategoryUpdated(),
    ],
    verify: (bloc) {
      verify(mockFirestoreRepository.updateSubCategory(
          categoryName: categoryName, categoryColor: categoryColor));
      return UpdateSubcategoryEvent(subCategoryModel).props;
    },
  );
}
