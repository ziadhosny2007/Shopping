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
import 'package:shopping/features/auth/data/api/auth_api.dart' as _i572;
import 'package:shopping/features/auth/data/repo/auth_data_source_imp.dart'
    as _i867;
import 'package:shopping/features/auth/data/repo/auth_repo_imp.dart' as _i1013;
import 'package:shopping/features/auth/domain/repo/auth_data_source_interface.dart'
    as _i900;
import 'package:shopping/features/auth/domain/repo/auth_repo_interface.dart'
    as _i340;
import 'package:shopping/features/auth/domain/use_case/auth_login_use_case.dart'
    as _i723;
import 'package:shopping/features/auth/domain/use_case/auth_register_use_case.dart'
    as _i751;
import 'package:shopping/features/auth/presentation/view_model/Login_cubit/login_cubit.dart'
    as _i116;
import 'package:shopping/features/auth/presentation/view_model/Register_cubit/register_cubit.dart'
    as _i123;
import 'package:shopping/features/cart/data/api/cart_api_imp.dart' as _i1037;
import 'package:shopping/features/cart/data/api/cart_api_interface.dart'
    as _i996;
import 'package:shopping/features/cart/data/repo/cart_data_source_imp.dart'
    as _i365;
import 'package:shopping/features/cart/data/repo/cart_repo_imp.dart' as _i948;
import 'package:shopping/features/cart/domain/repo/cart_data_source_interface.dart'
    as _i1059;
import 'package:shopping/features/cart/domain/repo/cart_repo_interface.dart'
    as _i466;
import 'package:shopping/features/cart/domain/use_case/add_item_use_case.dart'
    as _i1037;
import 'package:shopping/features/cart/domain/use_case/delete_item_use_case.dart'
    as _i535;
import 'package:shopping/features/cart/domain/use_case/get_cart_use_case.dart'
    as _i562;
import 'package:shopping/features/cart/presentation/view_model/cart_cubit.dart'
    as _i798;
import 'package:shopping/features/favourite/data/api/favourite_api_imp.dart'
    as _i211;
import 'package:shopping/features/favourite/data/api/favourite_api_interface.dart'
    as _i395;
import 'package:shopping/features/favourite/data/repo/favourite_data_source_imp.dart'
    as _i343;
import 'package:shopping/features/favourite/data/repo/favourite_repo_imp.dart'
    as _i287;
import 'package:shopping/features/favourite/domain/repo/favourite_data_source_interface.dart'
    as _i1040;
import 'package:shopping/features/favourite/domain/repo/favourite_repo_interface.dart'
    as _i264;
import 'package:shopping/features/favourite/domain/use_case/add_item_use_case.dart'
    as _i499;
import 'package:shopping/features/favourite/domain/use_case/delete_item_use_case.dart'
    as _i96;
import 'package:shopping/features/favourite/domain/use_case/get_favourite_use_case.dart'
    as _i636;
import 'package:shopping/features/favourite/presentation/view_model/favourite_cubit.dart'
    as _i536;
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
import 'package:shopping/features/product_by_category/data/api/product_by_category_api_imp.dart'
    as _i886;
import 'package:shopping/features/product_by_category/data/api/product_by_category_api_interface.dart'
    as _i705;
import 'package:shopping/features/product_by_category/data/repo/product_by_category_data_source_imp.dart'
    as _i324;
import 'package:shopping/features/product_by_category/data/repo/product_by_category_repo_imp.dart'
    as _i87;
import 'package:shopping/features/product_by_category/domain/repo/product_by_category_data_source_interface.dart'
    as _i830;
import 'package:shopping/features/product_by_category/domain/repo/product_by_category_repo_interface.dart'
    as _i1033;
import 'package:shopping/features/product_by_category/domain/use_case/product_by_category_use_case.dart'
    as _i836;
import 'package:shopping/features/product_by_category/presentation/view_model/product_by_category_cubit.dart'
    as _i716;
import 'package:shopping/features/product_details/data/api/product_details_api_imp.dart'
    as _i713;
import 'package:shopping/features/product_details/data/api/product_details_api_interface.dart'
    as _i918;
import 'package:shopping/features/product_details/data/repo/product_details_data_source_imp.dart'
    as _i604;
import 'package:shopping/features/product_details/data/repo/product_details_repo_imp.dart'
    as _i650;
import 'package:shopping/features/product_details/domain/repo/product_details_data_source_interface.dart'
    as _i244;
import 'package:shopping/features/product_details/domain/repo/product_details_repo_interface.dart'
    as _i476;
import 'package:shopping/features/product_details/domain/use_case/get_product_details_use_case.dart'
    as _i1059;
import 'package:shopping/features/product_details/presentation/view_model/product_details_cubit.dart'
    as _i536;
import 'package:shopping/features/search/data/api/search_api_imp.dart' as _i128;
import 'package:shopping/features/search/data/api/search_api_interface.dart'
    as _i393;
import 'package:shopping/features/search/data/repo/search_data_source_imp.dart'
    as _i445;
import 'package:shopping/features/search/data/repo/search_repo_imp.dart'
    as _i503;
import 'package:shopping/features/search/domain/repo/search_data_source_interface.dart'
    as _i812;
import 'package:shopping/features/search/domain/repo/search_repo_interface.dart'
    as _i565;
import 'package:shopping/features/search/domain/use_case/search_use_case.dart'
    as _i408;
import 'package:shopping/features/search/presentation/view_model/search_cubit.dart'
    as _i788;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final storageModel = _$StorageModel();
    gh.factory<_i558.FlutterSecureStorage>(() => storageModel.storage);
    gh.factory<_i572.AuthApi>(() => _i572.AuthApi());
    gh.lazySingleton<_i414.AppSecureStorage>(
      () => _i414.AppSecureStorage(gh<_i558.FlutterSecureStorage>()),
    );
    gh.factory<_i393.SearchApiInterface>(
      () => _i128.SearchApiImp(gh<_i414.AppSecureStorage>()),
    );
    gh.factory<_i705.ProductByCategoryApiInterface>(
      () => _i886.ProductByCategoryApiImp(gh<_i414.AppSecureStorage>()),
    );
    gh.factory<_i395.FavouriteApiInterface>(
      () => _i211.FavouriteApiImp(gh<_i414.AppSecureStorage>()),
    );
    gh.factory<_i996.CartApiInterface>(
      () => _i1037.CartApiImp(gh<_i414.AppSecureStorage>()),
    );
    gh.factory<_i812.SearchDataSourceInterface>(
      () => _i445.SearchDataSourceImp(gh<_i393.SearchApiInterface>()),
    );
    gh.factory<_i918.ProductDetailsApiInterface>(
      () => _i713.ProductDetailsApiImp(gh<_i414.AppSecureStorage>()),
    );
    gh.factory<_i244.ProductDetailsDataSourceInterface>(
      () => _i604.ProductDetailsDataSourceImp(
        gh<_i918.ProductDetailsApiInterface>(),
      ),
    );
    gh.factory<_i830.ProductByCategoryDataSourceInterface>(
      () => _i324.ProductByCategoryDataSourceImp(
        gh<_i705.ProductByCategoryApiInterface>(),
      ),
    );
    gh.factory<_i900.AuthDataSourceInterface>(
      () => _i867.AuthDataSourceImp(gh<_i572.AuthApi>()),
    );
    gh.factory<_i801.HomeProductApiInterface>(
      () => _i361.HomeProductApi(gh<_i414.AppSecureStorage>()),
    );
    gh.factory<_i1033.ProductByCategoryRepoInterface>(
      () => _i87.ProductByCategoryRepoImp(
        gh<_i830.ProductByCategoryDataSourceInterface>(),
      ),
    );
    gh.factory<_i836.ProductByCategoryUseCase>(
      () => _i836.ProductByCategoryUseCase(
        gh<_i1033.ProductByCategoryRepoInterface>(),
      ),
    );
    gh.factory<_i716.ProductByCategoryCubit>(
      () => _i716.ProductByCategoryCubit(gh<_i836.ProductByCategoryUseCase>()),
    );
    gh.factory<_i1040.FavouriteDataSourceInterface>(
      () => _i343.FavouriteDataSourceImp(gh<_i395.FavouriteApiInterface>()),
    );
    gh.factory<_i1059.CartDataSourceInterface>(
      () => _i365.CartDataSourceImp(gh<_i996.CartApiInterface>()),
    );
    gh.factory<_i565.SearchRepoInterface>(
      () => _i503.SearchRepoImp(gh<_i812.SearchDataSourceInterface>()),
    );
    gh.factory<_i340.AuthRepoInterface>(
      () => _i1013.AuthRepoImp(gh<_i900.AuthDataSourceInterface>()),
    );
    gh.factory<_i476.ProductDetailsRepoInterface>(
      () => _i650.ProductDetailsRepoImp(
        gh<_i244.ProductDetailsDataSourceInterface>(),
      ),
    );
    gh.factory<_i723.AuthLoginUseCase>(
      () => _i723.AuthLoginUseCase(gh<_i340.AuthRepoInterface>()),
    );
    gh.factory<_i751.AuthRegisterUseCase>(
      () => _i751.AuthRegisterUseCase(gh<_i340.AuthRepoInterface>()),
    );
    gh.factory<_i466.CartRepoInterface>(
      () => _i948.CartRepoImp(gh<_i1059.CartDataSourceInterface>()),
    );
    gh.factory<_i408.SearchUseCase>(
      () => _i408.SearchUseCase(gh<_i565.SearchRepoInterface>()),
    );
    gh.factory<_i1059.GetProductDetailsUseCase>(
      () => _i1059.GetProductDetailsUseCase(
        gh<_i476.ProductDetailsRepoInterface>(),
      ),
    );
    gh.factory<_i264.FavouriteRepoInterface>(
      () => _i287.FavouriteRepoImp(gh<_i1040.FavouriteDataSourceInterface>()),
    );
    gh.factory<_i536.ProductDetailsCubit>(
      () => _i536.ProductDetailsCubit(gh<_i1059.GetProductDetailsUseCase>()),
    );
    gh.factory<_i988.HomeDataSourceInterface>(
      () => _i166.HomeDataSourceImp(gh<_i801.HomeProductApiInterface>()),
    );
    gh.factory<_i499.AddItemToFavouriteUseCase>(
      () => _i499.AddItemToFavouriteUseCase(gh<_i264.FavouriteRepoInterface>()),
    );
    gh.factory<_i96.DeleteItemUseCase>(
      () => _i96.DeleteItemUseCase(gh<_i264.FavouriteRepoInterface>()),
    );
    gh.factory<_i636.GetFavouriteUseCase>(
      () => _i636.GetFavouriteUseCase(gh<_i264.FavouriteRepoInterface>()),
    );
    gh.factory<_i123.RegisterCubit>(
      () => _i123.RegisterCubit(gh<_i751.AuthRegisterUseCase>()),
    );
    gh.factory<_i788.SearchCubit>(
      () => _i788.SearchCubit(gh<_i408.SearchUseCase>()),
    );
    gh.factory<_i116.LoginCubit>(
      () => _i116.LoginCubit(gh<_i723.AuthLoginUseCase>()),
    );
    gh.factory<_i1037.AddItemToCartUseCase>(
      () => _i1037.AddItemToCartUseCase(gh<_i466.CartRepoInterface>()),
    );
    gh.factory<_i535.DeleteItemFromCartUseCase>(
      () => _i535.DeleteItemFromCartUseCase(gh<_i466.CartRepoInterface>()),
    );
    gh.factory<_i562.GetCartUseCase>(
      () => _i562.GetCartUseCase(gh<_i466.CartRepoInterface>()),
    );
    gh.factory<_i798.CartCubit>(
      () => _i798.CartCubit(
        gh<_i1037.AddItemToCartUseCase>(),
        gh<_i535.DeleteItemFromCartUseCase>(),
        gh<_i562.GetCartUseCase>(),
      ),
    );
    gh.factory<_i536.FavouriteCubit>(
      () => _i536.FavouriteCubit(
        gh<_i499.AddItemToFavouriteUseCase>(),
        gh<_i96.DeleteItemUseCase>(),
        gh<_i636.GetFavouriteUseCase>(),
      ),
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
