import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping/core/di/service_locator.config.dart';

import 'service_locator.config.dart';
	
final getIt = GetIt.instance;  
  
@InjectableInit()  
void configureDependencies() => getIt.init();