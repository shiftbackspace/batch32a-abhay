import 'package:Busx/app/constants/api_endpoint.dart';
import 'package:Busx/core/failure/failure.dart';
import 'package:Busx/core/networking/remote/http_service.dart';
import 'package:Busx/core/shared_prefs/user_shared_prefs.dart';
import 'package:Busx/users/data/data_source/dto/get_all_users_dto.dart';
import 'package:Busx/users/domain/entity/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@GenerateNiceMocks([
  MockSpec<AuthUseCase>(), //mock class for authusecase
  MockSpec<LoginViewNavigator>(), // mock class for login view
  // MockSpec<RegisterViewNavigator>(),
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AuthUseCase mockAuthUseCase;
  late ProviderContainer container;
  late LoginViewNavigator mockLoginViewNavigator;
  setUp(() {
    mockAuthUseCase = MockAuthUseCase();
    mockLoginViewNavigator = MockLoginViewNavigator();
    container = ProviderContainer(overrides: [
      authViewModelProvider.overrideWith(
          (ref) => AuthViewModel(mockAuthUseCase, mockLoginViewNavigator))
    ]);
  });
  test("check for the inital state in auth state", () {
    final authState = container.read(authViewModelProvider);
    expect(authState.isLoading, false);
    expect(authState.error, isNull);
  });
  test('login test with valid email and password', () async {
    const correctEmail = 'abc@gmail.com';
    const correctPassword = 'abc123';
    //Arrange

    when(mockAuthUseCase.loginUser(any, any)).thenAnswer((invocation) {
      final email = invocation.positionalArguments[0] as String;
      final password = invocation.positionalArguments[1] as String;
      return Future.value(
        email == correctEmail && password == correctPassword
            ? const Right(true)
            : Left(Failure(error: 'Invalid')),
      );
    });

    //Act
    container
        .read(authViewModelProvider.notifier)
        .loginUser('abc@gmail.com', 'abc123');

    final authState = container.read(authViewModelProvider);

    //Assert
    expect(authState.error, isNull);
  });

  test(
    'Register new user test with all details test',
    () async {
      // Arrange
      when(mockAuthUseCase.registerUser(any)).thenAnswer((innovation) {
        final auth = innovation.positionalArguments[0] as AuthEntity;

        return Future.value(
          auth.fname.isNotEmpty &&
                  auth.lname.isNotEmpty &&
                  auth.email.isNotEmpty &&
                  auth.password.isNotEmpty &&
                  auth.email.contains('@') &&
                  auth.email.contains('.') &&
                  auth.phone.length == 10
              ? const Right(true)
              : Left(
                  Failure(error: 'Invalid'),
                ),
        );
      });

      // Act
      container
          .read(authViewModelProvider.notifier)
          .registerUser(const AuthEntity(
            fname: 'abc',
            lname: 'cde',
            email: 'abc@gmail.com',
            password: '12345678',
            phone: '1234567890',
          ));

      final state = container.read(authViewModelProvider);

      // Assert
      expect(state.isLoading, true);
      expect(state.error, null);
    },
  );

  tearDown(() {
    container.dispose();
  });
}