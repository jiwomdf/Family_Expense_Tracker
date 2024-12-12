import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:group_expense_tracker/presentation/bloc/logout/logout_bloc.dart';
import 'package:mockito/mockito.dart';

import '../../../helper/test_helper.mocks.dart';

void main() {
  late LogoutBloc logoutBloc;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    logoutBloc = LogoutBloc(mockAuthRepository);
  });

  blocTest<LogoutBloc, LogoutState>(
    'Should emit [GetLoginEvent] when data is inserted successfully',
    build: () {
      when(mockAuthRepository.logout()).thenAnswer((_) async {});
      return logoutBloc;
    },
    act: (bloc) => bloc.add(const GetLogoutEvent()),
    expect: () => [
      LogoutLoading(),
      const LogoutHasData(),
    ],
    verify: (bloc) {
      verify(mockAuthRepository.logout());
      return const GetLogoutEvent().props;
    },
  );
}
