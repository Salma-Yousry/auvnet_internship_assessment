// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/datasources/remote_data_source.dart' as _i98;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/domain/use_case/login_use_case.dart' as _i973;
import '../../features/auth/domain/use_case/signup_usecase.dart' as _i305;
import '../../features/auth/presentation/bloc/login_bloc/login_bloc.dart'
    as _i450;
import '../../features/auth/presentation/bloc/signup_bloc/signup_bloc.dart'
    as _i18;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i98.RemoteDataSource>(() => _i98.RemoteDataSource());
    gh.lazySingleton<_i787.AuthRepository>(() => _i153.AuthRepositoryImpl(
        remoteDataSource: gh<_i98.RemoteDataSource>()));
    gh.factory<_i973.LoginUseCase>(
        () => _i973.LoginUseCase(authRepository: gh<_i787.AuthRepository>()));
    gh.factory<_i305.SignupUseCase>(
        () => _i305.SignupUseCase(authRepository: gh<_i787.AuthRepository>()));
    gh.factory<_i18.SignupBloc>(
        () => _i18.SignupBloc(signupUseCase: gh<_i305.SignupUseCase>()));
    gh.factory<_i450.LoginBloc>(
        () => _i450.LoginBloc(loginUseCase: gh<_i973.LoginUseCase>()));
    return this;
  }
}
