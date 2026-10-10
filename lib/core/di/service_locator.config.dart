// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shopping/core/di/storage_module.dart' as _i463;
import 'package:shopping/core/helper/app_secure_storage.dart' as _i414;
import 'package:shopping/features/home/data/api/home_product_api.dart' as _i361;
import 'package:shopping/features/home/data/api/home_product_api_interface.dart'
    as _i801;
import 'package:shopping/features/home/data/repo/home_data_source_imp.dart'
    as _i166;
import 'package:shopping/features/home/data/repo/home_repo_imp.dart' as _i338;
import 'package:shopping/features/home/domain/repo/home_data_source_interface.dart'
    as _i988;
import 'package:shopping/features/home/domain/repo/home_repo_interface.dart'
    as _i19;
import 'package:shopping/features/home/domain/use_case/get_all_categories_use_case.dart'
    as _i27;
import 'package:shopping/features/home/domain/use_case/get_item_use_case.dart'
    as _i1018;
import 'package:shopping/features/home/presentation/view_model/home_cubit.dart'
    as _i724;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final storageModel = _$StorageModel();
    gh.factory<_i558.FlutterSecureStorage>(() => storageModel.storage);
    gh.lazySingleton<_i414.AppSecureStorage>(
      () => _i414.AppSecureStorage(gh<_i558.FlutterSecureStorage>()),
    );
    gh.factory<_i801.HomeProductApiInterface>(
      () => _i361.HomeProductApi(gh<_i414.AppSecureStorage>()),
    );
    gh.factory<_i988.HomeDataSourceInterface>(
      () => _i166.HomeDataSourceImp(gh<_i801.HomeProductApiInterface>()),
    );
    gh.factory<_i19.HomeRepoInterface>(
      () => _i338.HomeRepoImp(gh<_i988.HomeDataSourceInterface>()),
    );
    gh.factory<_i27.GetAllCategoriesUseCase>(
      () => _i27.GetAllCategoriesUseCase(gh<_i19.HomeRepoInterface>()),
    );
    gh.factory<_i1018.GetItemUseCase>(
      () => _i1018.GetItemUseCase(gh<_i19.HomeRepoInterface>()),
    );
    gh.factory<_i724.HomeCubit>(
      () => _i724.HomeCubit(
        gh<_i1018.GetItemUseCase>(),
        gh<_i27.GetAllCategoriesUseCase>(),
      ),
    );
    return this;
  }
}

class _$StorageModel extends _i463.StorageModel {}
