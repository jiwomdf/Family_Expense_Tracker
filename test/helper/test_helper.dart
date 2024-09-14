import 'package:core/repository/auth_repository.dart';
import 'package:core/repository/fcm_repository.dart';
import 'package:core/repository/firestore_repository.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  FirestoreRepository,
  FcmRepository,
  AuthRepository,
])
void main() {}
