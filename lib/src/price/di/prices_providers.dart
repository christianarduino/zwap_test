import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:zwap_pricing/src/price/data/prices_repository_impl.dart';
import 'package:zwap_pricing/src/price/data/remote/prices_remote_data_source.dart';
import 'package:zwap_pricing/src/price/data/remote/prices_remote_data_source_impl.dart';
import 'package:zwap_pricing/src/price/domain/prices_repository.dart';
import 'package:zwap_pricing/src/price/ui/viewmodel/prices_viewmodel.dart';

List<SingleChildWidget> pricesProviders = [
  ..._indipendentProviders,
  ..._dipendentProviders,
];

List<SingleChildWidget> _indipendentProviders = [
  Provider<PricesRemoteDataSource>(
    create: (_) => PricesRemoteDataSourceImpl(),
  ),
];

List<SingleChildWidget> _dipendentProviders = [
  ProxyProvider<PricesRemoteDataSource, PricesRepository>(
    update: (_, remoteDataSource, __) => PricesRepositoryImpl(remoteDataSource),
  ),
  ChangeNotifierProxyProvider<PricesRepository, PricesViewModel>(
    create: (_) => PricesViewModel(),
    update: (_, repository, viewModel) => viewModel!..update(repository),
  ),
];
