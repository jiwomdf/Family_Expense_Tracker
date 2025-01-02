import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/data/network/request/insert_expense_request.dart';
import 'package:core/domain/model/category_model.dart';
import 'package:core/domain/model/expense_category_model.dart';
import 'package:core/domain/model/failure.dart';
import 'package:core/domain/model/sub_category_model.dart';
import 'package:core/util/color_util.dart';
import 'package:core/util/date_format_util.dart';
import 'package:core/util/firestore_constants.dart';
import 'package:core/util/int_util.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreRepository {
  final FirebaseAuth firebaseAuth;
  FirestoreRepository({required this.firebaseAuth});

  final CollectionReference _expenseCollection =
      FirebaseFirestore.instance.collection(ExpenseConstants.constantName);

  final CollectionReference _categoryCollection =
      FirebaseFirestore.instance.collection(CategoryConstants.constantName);

  final CollectionReference _subCategoryCollection =
      FirebaseFirestore.instance.collection(SubCategoryConstants.constantName);

  List<SubCategoryModel> subCategoryCache = [];

  Future<Either<Failure, void>> updateExpense({
    required String id,
    required Map<String, dynamic> expenseRequest,
  }) async {
    try {
      expenseRequest[ExpenseConstants.email] = firebaseAuth.currentUser?.email;
      await _expenseCollection.doc(id).set(expenseRequest);
      return const Right(null);
    } catch (ex) {
      return Left(ServerFailure(ex.toString()));
    }
  }

  Future<Either<Failure, void>> updateBatchExpense({
    required List<Map<String, dynamic>> listdata,
  }) async {
    try {
      var batch = FirebaseFirestore.instance.batch();

      for (var i = 0; i < listdata.length; i++) {
        var data = listdata[i];
        await Future.delayed(const Duration(milliseconds: 300));
        batch.update(_expenseCollection.doc(data['id']), data);
      }

      batch.commit();
      return const Right(null);
    } catch (ex) {
      return Left(ServerFailure(ex.toString()));
    }
  }

  Future<Either<Failure, void>> insertExpense(
    Map<String, dynamic> expenseRequest,
  ) async {
    try {
      expenseRequest[ExpenseConstants.email] = firebaseAuth.currentUser?.email;
      await _expenseCollection.add(expenseRequest);
      return const Right(null);
    } catch (ex) {
      return Left(ServerFailure(ex.toString()));
    }
  }

  Future<Either<Failure, void>> insertBatchExpense({
    required List<InsertExpenseRequest> listExpenseRequest,
  }) async {
    try {
      var batch = FirebaseFirestore.instance.batch();

      for (var i = 0; i < listExpenseRequest.length; i++) {
        var expense = listExpenseRequest[i];
        await Future.delayed(const Duration(milliseconds: 500));
        batch.set(_expenseCollection.doc(), expense.toJson());
      }

      batch.commit();
      return const Right(null);
    } catch (ex) {
      return Left(ServerFailure(ex.toString()));
    }
  }

  Future<Either<Failure, List<ExpenseCategoryModel>>> getAllExpense() async {
    try {
      QuerySnapshot expenseSnapShoot = await _expenseCollection.get();
      QuerySnapshot categorySnapShoot = await _categoryCollection.get();
      QuerySnapshot subCategorySnapShoot = await _subCategoryCollection.get();
      List<ExpenseCategoryModel> expense = [];

      for (var doc in expenseSnapShoot.docs) {
        var category = categorySnapShoot.docs.where((itm) {
          return doc.get(ExpenseConstants.categoryId) ==
              itm.get(CategoryConstants.categoryId);
        });

        var subCategory = subCategorySnapShoot.docs.where(((itm) {
          return doc.get(ExpenseConstants.subCategoryId) ==
              itm.get(SubCategoryConstants.subCategoryId);
        }));

        var categoryName = "";
        if (category.isNotEmpty) {
          categoryName = category.first.get(CategoryConstants.categoryName);
        }

        var categoryColor = 4278190080;
        if (category.isNotEmpty) {
          categoryColor = category.first.get(CategoryConstants.categoryColor);
        }

        var subCategoryName = "";
        if (category.isNotEmpty) {
          subCategoryName =
              subCategory.first.get(CategoryConstants.categoryName);
        }

        var subCategoryColor = 4288585374;
        if (category.isNotEmpty) {
          subCategoryColor =
              subCategory.first.get(CategoryConstants.categoryColor);
        }

        expense.add(ExpenseCategoryModel(
          id: doc.id,
          email: doc.get(ExpenseConstants.email) ?? '',
          note: doc.get(ExpenseConstants.note) ?? '',
          price: doc.get(ExpenseConstants.price) ?? '',
          date: doc.get(ExpenseConstants.date) ?? '',
          categoryId: doc.get(ExpenseConstants.categoryId) ?? '',
          categoryName: categoryName,
          categoryColor: categoryColor,
          subCategoryId: doc.get(ExpenseConstants.subCategoryId),
          subCategoryName: subCategoryName,
          subCategoryColor: subCategoryColor,
          year: doc.get(ExpenseConstants.year) ?? '',
          month: doc.get(ExpenseConstants.month) ?? '',
          dayOfMonth: doc.get(ExpenseConstants.dayOfMonth) ?? '',
          timeStamp: doc.get(ExpenseConstants.timeStamp) ?? '',
          status: doc.get(ExpenseConstants.status) ?? '',
        ));
      }

      expense.sort((a, b) {
        var date1 = b.date.toDateGlobalFormat() ?? DateTime.now();
        var date2 = a.date.toDateGlobalFormat() ?? DateTime.now();
        return date1.compareTo(date2);
      });
      return Right(expense);
    } catch (ex) {
      return Left(ServerFailure(ex.toString()));
    }
  }

  Future<Either<Failure, List<ExpenseCategoryModel>>> getExpense(
      int month, int year, String subCategory) async {
    try {
      QuerySnapshot? expenseSnapShoot;
      if (subCategory.isNotEmpty) {
        expenseSnapShoot = await _expenseCollection
            .where('month', isEqualTo: month.addZeroPref())
            .where('year', isEqualTo: year.toString())
            .where('subCategoryName', isEqualTo: subCategory)
            .get();
      } else {
        expenseSnapShoot = await _expenseCollection
            .where('month', isEqualTo: month.addZeroPref())
            .where('year', isEqualTo: year.toString())
            .get();
      }

      QuerySnapshot categorySnapShoot = await _categoryCollection.get();
      QuerySnapshot subCategorySnapShoot = await _subCategoryCollection.get();
      List<ExpenseCategoryModel> expense = [];

      for (var doc in expenseSnapShoot.docs) {
        var category = categorySnapShoot.docs.where((itm) {
          return doc.get(ExpenseConstants.categoryId) ==
              itm.get(CategoryConstants.categoryId);
        });

        var subCategory = subCategorySnapShoot.docs.where(((itm) {
          return doc.get(ExpenseConstants.subCategoryId) ==
              itm.get(SubCategoryConstants.subCategoryId);
        }));

        var categoryName = "";
        if (category.isNotEmpty) {
          categoryName = category.first.get(CategoryConstants.categoryName);
        }

        var categoryColor = categoryDefaultColor;
        if (category.isNotEmpty) {
          categoryColor = category.first.get(CategoryConstants.categoryColor);
        }

        var subCategoryName = "";
        if (category.isNotEmpty) {
          subCategoryName =
              subCategory.first.get(CategoryConstants.categoryName);
        }

        var subCategoryColor = subCategoryDefaultColor;
        if (category.isNotEmpty) {
          subCategoryColor =
              subCategory.first.get(CategoryConstants.categoryColor);
        }

        expense.add(ExpenseCategoryModel(
          id: doc.id,
          email: doc.get(ExpenseConstants.email) ?? '',
          note: doc.get(ExpenseConstants.note) ?? '',
          price: doc.get(ExpenseConstants.price) ?? '',
          date: doc.get(ExpenseConstants.date) ?? '',
          categoryId: doc.get(ExpenseConstants.categoryId) ?? '',
          categoryName: categoryName,
          categoryColor: categoryColor,
          subCategoryId: doc.get(ExpenseConstants.subCategoryId),
          subCategoryName: subCategoryName,
          subCategoryColor: subCategoryColor,
          year: doc.get(ExpenseConstants.year) ?? '',
          month: doc.get(ExpenseConstants.month) ?? '',
          dayOfMonth: doc.get(ExpenseConstants.dayOfMonth) ?? '',
          timeStamp: doc.get(ExpenseConstants.timeStamp) ?? '',
          status: doc.get(ExpenseConstants.status) ?? '',
        ));
      }

      expense.sort((a, b) {
        var date1 = b.date.toDateGlobalFormat() ?? DateTime.now();
        var date2 = a.date.toDateGlobalFormat() ?? DateTime.now();
        return date1.compareTo(date2);
      });
      return Right(expense);
    } catch (ex) {
      return Left(ServerFailure(ex.toString()));
    }
  }

  Future<Either<Failure, void>> deleteExpense(String id) async {
    try {
      await _expenseCollection.doc(id).delete();

      return const Right(null);
    } catch (ex) {
      return Left(ServerFailure(ex.toString()));
    }
  }

  Future<Either<Failure, void>> updateCategory({
    required String categoryName,
    required int categoryColor,
  }) async {
    try {
      await _categoryCollection.doc(categoryName).set(
        {
          CategoryConstants.categoryName: categoryName,
          CategoryConstants.categoryColor: categoryColor,
          CategoryConstants.email: firebaseAuth.currentUser?.email ?? '',
        },
      );
      return const Right(null);
    } catch (ex) {
      return Left(ServerFailure(ex.toString()));
    }
  }

  Future<Either<Failure, List<CategoryModel>>> getCategory() async {
    try {
      QuerySnapshot categorySnapshot = await _categoryCollection.get();
      return Right(categorySnapshot.docs
          .map(
            (doc) => CategoryModel(
              categoryId: doc.get(CategoryConstants.categoryId),
              categoryColor: doc.get(CategoryConstants.categoryColor),
              categoryName: doc.get(CategoryConstants.categoryName),
            ),
          )
          .toList());
    } catch (ex) {
      return Left(ServerFailure(ex.toString()));
    }
  }

  Future<Either<Failure, void>> updateSubCategory({
    required String categoryName,
    required int categoryColor,
  }) async {
    try {
      await _subCategoryCollection.doc(categoryName).set(
        {
          SubCategoryConstants.subCategoryName: categoryName,
          SubCategoryConstants.subCategoryColor: categoryColor,
          SubCategoryConstants.email: firebaseAuth.currentUser?.email ?? '',
        },
      );
      return const Right(null);
    } catch (ex) {
      return Left(ServerFailure(ex.toString()));
    }
  }

  Future<Either<Failure, List<SubCategoryModel>>> getSubCategory() async {
    try {
      QuerySnapshot categorySnapshot = await _subCategoryCollection.get();
      subCategoryCache = categorySnapshot.docs
          .map(
            (doc) => SubCategoryModel(
              subCategoryId: doc.get(SubCategoryConstants.subCategoryId),
              subCategoryColor: doc.get(SubCategoryConstants.subCategoryColor),
              subCategoryName: doc.get(SubCategoryConstants.subCategoryName),
            ),
          )
          .toList();
      return Right(subCategoryCache);
    } catch (ex) {
      return Left(ServerFailure(ex.toString()));
    }
  }

  Future<Either<Failure, List<SubCategoryModel>>>
      getSubCategoryWithCache() async {
    try {
      if (subCategoryCache.isNotEmpty) {
        return Right(subCategoryCache);
      }

      QuerySnapshot categorySnapshot = await _subCategoryCollection.get();
      subCategoryCache = categorySnapshot.docs
          .map(
            (doc) => SubCategoryModel(
              subCategoryId: doc.get(SubCategoryConstants.subCategoryId),
              subCategoryColor: doc.get(SubCategoryConstants.subCategoryColor),
              subCategoryName: doc.get(SubCategoryConstants.subCategoryName),
            ),
          )
          .toList();
      return Right(subCategoryCache);
    } catch (ex) {
      return Left(ServerFailure(ex.toString()));
    }
  }
}
