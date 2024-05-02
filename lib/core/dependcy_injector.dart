import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vexana/vexana.dart';

import 'base/bloc/product_bloc.dart';
import 'init/network/network_manager.dart';
import 'base/service/i_product_service.dart';
import 'base/service/product_service.dart';

class DependencyInjector {
  static DependencyInjector? _instance;

  static DependencyInjector get instance {
    _instance ??= DependencyInjector._init();
    return _instance!;
  }

  late final INetworkManager networkManager;
  late IProductService _productService;
  late ProductBloc _productBloc;

  DependencyInjector._init() {
    networkManager = VexanaManager();
    _productService = ProductService(networkManager);
    _productBloc = ProductBloc(_productService);
  }

  List<BlocProvider<Bloc>> get globalBlocProviders => [
        BlocProvider<ProductBloc>(create: (context) => _productBloc),
      ];
}
