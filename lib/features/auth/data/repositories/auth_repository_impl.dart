import 'package:auvnet_internship_assessment/core/constants/app_strings.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/remote_data_source.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final RemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<UserEntity> login(String email, String password) async {
    try {
      final userCredential = await remoteDataSource.login(email, password);
      return UserEntity.fromUser(userCredential.user!);
    } catch (e) {
      throw Exception('${AppStrings.failedToLogin} $e');
    }
  }

  @override
  Future<UserEntity> signup(String email, String password) async {
    try {
      final userCredential = await remoteDataSource.signup(email, password);
      return UserEntity.fromUser(userCredential.user!);
    } catch (e) {
      throw Exception('${AppStrings.failedToSignup} $e');
    }
  }
}