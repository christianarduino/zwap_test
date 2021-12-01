

import 'package:zwap_pricing/src/price/data/remote/prices_remote_data_source.dart';
import 'package:zwap_pricing/src/price/domain/model/prices_response_model.dart';
import 'package:zwap_pricing/src/price/domain/prices_repository.dart';

class PricesRepositoryImpl extends PricesRepository {
  final PricesRemoteDataSource _remoteDataSource;

  PricesRepositoryImpl(this._remoteDataSource);

  @override
  Future<PricesResponseModel> getPrices() {
    return _remoteDataSource.getPrices();
  }
}
