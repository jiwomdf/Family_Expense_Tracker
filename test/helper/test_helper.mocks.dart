// Mocks generated by Mockito 5.4.4 from annotations
// in group_expense_tracker/test/helper/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;

import 'package:core/data/network/request/insert_expense_request.dart' as _i9;
import 'package:core/data/network/request/send_fcm_request.dart' as _i13;
import 'package:core/domain/model/category_model.dart' as _i11;
import 'package:core/domain/model/expense_category_model.dart' as _i10;
import 'package:core/domain/model/failure.dart' as _i8;
import 'package:core/domain/model/sub_category_model.dart' as _i6;
import 'package:core/domain/model/user_model.dart' as _i15;
import 'package:core/repository/auth_repository.dart' as _i14;
import 'package:core/repository/fcm_repository.dart' as _i12;
import 'package:core/repository/firestore_repository.dart' as _i5;
import 'package:dartz/dartz.dart' as _i3;
import 'package:firebase_auth/firebase_auth.dart' as _i2;
import 'package:http/http.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeFirebaseAuth_0 extends _i1.SmartFake implements _i2.FirebaseAuth {
  _FakeFirebaseAuth_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeClient_2 extends _i1.SmartFake implements _i4.Client {
  _FakeClient_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [FirestoreRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockFirestoreRepository extends _i1.Mock
    implements _i5.FirestoreRepository {
  MockFirestoreRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.FirebaseAuth get firebaseAuth => (super.noSuchMethod(
        Invocation.getter(#firebaseAuth),
        returnValue: _FakeFirebaseAuth_0(
          this,
          Invocation.getter(#firebaseAuth),
        ),
      ) as _i2.FirebaseAuth);

  @override
  List<_i6.SubCategoryModel> get subCategoryCache => (super.noSuchMethod(
        Invocation.getter(#subCategoryCache),
        returnValue: <_i6.SubCategoryModel>[],
      ) as List<_i6.SubCategoryModel>);

  @override
  set subCategoryCache(List<_i6.SubCategoryModel>? _subCategoryCache) =>
      super.noSuchMethod(
        Invocation.setter(
          #subCategoryCache,
          _subCategoryCache,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i7.Future<_i3.Either<_i8.Failure, void>> updateExpense({
    required String? id,
    required Map<String, dynamic>? expenseRequest,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateExpense,
          [],
          {
            #id: id,
            #expenseRequest: expenseRequest,
          },
        ),
        returnValue: _i7.Future<_i3.Either<_i8.Failure, void>>.value(
            _FakeEither_1<_i8.Failure, void>(
          this,
          Invocation.method(
            #updateExpense,
            [],
            {
              #id: id,
              #expenseRequest: expenseRequest,
            },
          ),
        )),
      ) as _i7.Future<_i3.Either<_i8.Failure, void>>);

  @override
  _i7.Future<_i3.Either<_i8.Failure, void>> updateBatchExpense(
          {required List<Map<String, dynamic>>? listdata}) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateBatchExpense,
          [],
          {#listdata: listdata},
        ),
        returnValue: _i7.Future<_i3.Either<_i8.Failure, void>>.value(
            _FakeEither_1<_i8.Failure, void>(
          this,
          Invocation.method(
            #updateBatchExpense,
            [],
            {#listdata: listdata},
          ),
        )),
      ) as _i7.Future<_i3.Either<_i8.Failure, void>>);

  @override
  _i7.Future<_i3.Either<_i8.Failure, void>> insertExpense(
          Map<String, dynamic>? expenseRequest) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertExpense,
          [expenseRequest],
        ),
        returnValue: _i7.Future<_i3.Either<_i8.Failure, void>>.value(
            _FakeEither_1<_i8.Failure, void>(
          this,
          Invocation.method(
            #insertExpense,
            [expenseRequest],
          ),
        )),
      ) as _i7.Future<_i3.Either<_i8.Failure, void>>);

  @override
  _i7.Future<_i3.Either<_i8.Failure, void>> insertBatchExpense(
          {required List<_i9.InsertExpenseRequest>? listExpenseRequest}) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertBatchExpense,
          [],
          {#listExpenseRequest: listExpenseRequest},
        ),
        returnValue: _i7.Future<_i3.Either<_i8.Failure, void>>.value(
            _FakeEither_1<_i8.Failure, void>(
          this,
          Invocation.method(
            #insertBatchExpense,
            [],
            {#listExpenseRequest: listExpenseRequest},
          ),
        )),
      ) as _i7.Future<_i3.Either<_i8.Failure, void>>);

  @override
  _i7.Future<_i3.Either<_i8.Failure, List<_i10.ExpenseCategoryModel>>>
      getAllExpense() => (super.noSuchMethod(
            Invocation.method(
              #getAllExpense,
              [],
            ),
            returnValue: _i7.Future<
                    _i3.Either<_i8.Failure,
                        List<_i10.ExpenseCategoryModel>>>.value(
                _FakeEither_1<_i8.Failure, List<_i10.ExpenseCategoryModel>>(
              this,
              Invocation.method(
                #getAllExpense,
                [],
              ),
            )),
          ) as _i7.Future<
              _i3.Either<_i8.Failure, List<_i10.ExpenseCategoryModel>>>);

  @override
  _i7.Future<
      _i3.Either<_i8.Failure, List<_i10.ExpenseCategoryModel>>> getExpense(
    int? month,
    int? year,
    String? subCategory,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getExpense,
          [
            month,
            year,
            subCategory,
          ],
        ),
        returnValue: _i7.Future<
                _i3.Either<_i8.Failure, List<_i10.ExpenseCategoryModel>>>.value(
            _FakeEither_1<_i8.Failure, List<_i10.ExpenseCategoryModel>>(
          this,
          Invocation.method(
            #getExpense,
            [
              month,
              year,
              subCategory,
            ],
          ),
        )),
      ) as _i7
          .Future<_i3.Either<_i8.Failure, List<_i10.ExpenseCategoryModel>>>);

  @override
  _i7.Future<_i3.Either<_i8.Failure, void>> deleteExpense(String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteExpense,
          [id],
        ),
        returnValue: _i7.Future<_i3.Either<_i8.Failure, void>>.value(
            _FakeEither_1<_i8.Failure, void>(
          this,
          Invocation.method(
            #deleteExpense,
            [id],
          ),
        )),
      ) as _i7.Future<_i3.Either<_i8.Failure, void>>);

  @override
  _i7.Future<_i3.Either<_i8.Failure, void>> updateCategory({
    required String? categoryName,
    required int? categoryColor,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateCategory,
          [],
          {
            #categoryName: categoryName,
            #categoryColor: categoryColor,
          },
        ),
        returnValue: _i7.Future<_i3.Either<_i8.Failure, void>>.value(
            _FakeEither_1<_i8.Failure, void>(
          this,
          Invocation.method(
            #updateCategory,
            [],
            {
              #categoryName: categoryName,
              #categoryColor: categoryColor,
            },
          ),
        )),
      ) as _i7.Future<_i3.Either<_i8.Failure, void>>);

  @override
  _i7.Future<_i3.Either<_i8.Failure, List<_i11.CategoryModel>>> getCategory() =>
      (super.noSuchMethod(
        Invocation.method(
          #getCategory,
          [],
        ),
        returnValue:
            _i7.Future<_i3.Either<_i8.Failure, List<_i11.CategoryModel>>>.value(
                _FakeEither_1<_i8.Failure, List<_i11.CategoryModel>>(
          this,
          Invocation.method(
            #getCategory,
            [],
          ),
        )),
      ) as _i7.Future<_i3.Either<_i8.Failure, List<_i11.CategoryModel>>>);

  @override
  _i7.Future<_i3.Either<_i8.Failure, void>> updateSubCategory({
    required String? categoryName,
    required int? categoryColor,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateSubCategory,
          [],
          {
            #categoryName: categoryName,
            #categoryColor: categoryColor,
          },
        ),
        returnValue: _i7.Future<_i3.Either<_i8.Failure, void>>.value(
            _FakeEither_1<_i8.Failure, void>(
          this,
          Invocation.method(
            #updateSubCategory,
            [],
            {
              #categoryName: categoryName,
              #categoryColor: categoryColor,
            },
          ),
        )),
      ) as _i7.Future<_i3.Either<_i8.Failure, void>>);

  @override
  _i7.Future<_i3.Either<_i8.Failure, List<_i6.SubCategoryModel>>>
      getSubCategory() => (super.noSuchMethod(
            Invocation.method(
              #getSubCategory,
              [],
            ),
            returnValue: _i7.Future<
                    _i3.Either<_i8.Failure, List<_i6.SubCategoryModel>>>.value(
                _FakeEither_1<_i8.Failure, List<_i6.SubCategoryModel>>(
              this,
              Invocation.method(
                #getSubCategory,
                [],
              ),
            )),
          ) as _i7.Future<_i3.Either<_i8.Failure, List<_i6.SubCategoryModel>>>);

  @override
  _i7.Future<_i3.Either<_i8.Failure, List<_i6.SubCategoryModel>>>
      getSubCategoryWithCache() => (super.noSuchMethod(
            Invocation.method(
              #getSubCategoryWithCache,
              [],
            ),
            returnValue: _i7.Future<
                    _i3.Either<_i8.Failure, List<_i6.SubCategoryModel>>>.value(
                _FakeEither_1<_i8.Failure, List<_i6.SubCategoryModel>>(
              this,
              Invocation.method(
                #getSubCategoryWithCache,
                [],
              ),
            )),
          ) as _i7.Future<_i3.Either<_i8.Failure, List<_i6.SubCategoryModel>>>);
}

/// A class which mocks [FcmRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockFcmRepository extends _i1.Mock implements _i12.FcmRepository {
  MockFcmRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Client get client => (super.noSuchMethod(
        Invocation.getter(#client),
        returnValue: _FakeClient_2(
          this,
          Invocation.getter(#client),
        ),
      ) as _i4.Client);

  @override
  _i7.Future<_i3.Either<_i8.Failure, bool>> sendFcm(
          _i13.SendFcmRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #sendFcm,
          [request],
        ),
        returnValue: _i7.Future<_i3.Either<_i8.Failure, bool>>.value(
            _FakeEither_1<_i8.Failure, bool>(
          this,
          Invocation.method(
            #sendFcm,
            [request],
          ),
        )),
      ) as _i7.Future<_i3.Either<_i8.Failure, bool>>);
}

/// A class which mocks [AuthRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRepository extends _i1.Mock implements _i14.AuthRepository {
  MockAuthRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.FirebaseAuth get firebaseAuth => (super.noSuchMethod(
        Invocation.getter(#firebaseAuth),
        returnValue: _FakeFirebaseAuth_0(
          this,
          Invocation.getter(#firebaseAuth),
        ),
      ) as _i2.FirebaseAuth);

  @override
  _i7.Stream<_i15.UserModel?> get user => (super.noSuchMethod(
        Invocation.getter(#user),
        returnValue: _i7.Stream<_i15.UserModel?>.empty(),
      ) as _i7.Stream<_i15.UserModel?>);

  @override
  _i7.Future<_i3.Either<_i8.Failure, bool>> register(
    String? email,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #register,
          [
            email,
            password,
          ],
        ),
        returnValue: _i7.Future<_i3.Either<_i8.Failure, bool>>.value(
            _FakeEither_1<_i8.Failure, bool>(
          this,
          Invocation.method(
            #register,
            [
              email,
              password,
            ],
          ),
        )),
      ) as _i7.Future<_i3.Either<_i8.Failure, bool>>);

  @override
  _i7.Future<_i3.Either<_i8.Failure, _i15.UserDataModel>> login(
    String? email,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #login,
          [
            email,
            password,
          ],
        ),
        returnValue:
            _i7.Future<_i3.Either<_i8.Failure, _i15.UserDataModel>>.value(
                _FakeEither_1<_i8.Failure, _i15.UserDataModel>(
          this,
          Invocation.method(
            #login,
            [
              email,
              password,
            ],
          ),
        )),
      ) as _i7.Future<_i3.Either<_i8.Failure, _i15.UserDataModel>>);

  @override
  _i7.Future<void> logout() => (super.noSuchMethod(
        Invocation.method(
          #logout,
          [],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<_i3.Either<_i8.Failure, _i15.UserDataModel>> getUserDataModel() =>
      (super.noSuchMethod(
        Invocation.method(
          #getUserDataModel,
          [],
        ),
        returnValue:
            _i7.Future<_i3.Either<_i8.Failure, _i15.UserDataModel>>.value(
                _FakeEither_1<_i8.Failure, _i15.UserDataModel>(
          this,
          Invocation.method(
            #getUserDataModel,
            [],
          ),
        )),
      ) as _i7.Future<_i3.Either<_i8.Failure, _i15.UserDataModel>>);
}
