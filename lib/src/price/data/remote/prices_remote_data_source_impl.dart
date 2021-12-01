
import 'package:zwap_pricing/src/price/data/dtx/network_prices_response_model_ext.dart';
import 'package:zwap_pricing/src/price/data/model/network_prices_response_model.dart';
import 'package:zwap_pricing/src/price/data/remote/prices_remote_data_source.dart';
import 'package:zwap_pricing/src/price/domain/model/prices_response_model.dart';

class PricesRemoteDataSourceImpl extends PricesRemoteDataSource {
  @override
  Future<PricesResponseModel> getPrices() async {
    /* final file = File('../../../../resources/get_prices_mock.json');
    final json = jsonDecode(await file.readAsString()); */
    await Future.delayed(const Duration(seconds: 1));
    return NetworkPricesResponseModel.fromJson({
      "annual": [
        {
          "id": 1,
          "title": "Basic ⭐️",
          "description":
              "A great way to get started with Zwap and experience all of the buttery smooth goodness. Free forever. Not too shabby eh?",
          "price": 0,
          "is_current_plan": false,
          "features": [
            {"name": "Unlimited random matches", "enabled": true},
            {"name": "Store up to 20 contacts", "enabled": true},
            {"name": "Unlimited matches", "enabled": false},
            {"name": "5 Super Intro a week", "enabled": false}
          ]
        },
        {
          "id": 2,
          "title": "Pro ✨",
          "description":
              "Is basic a bit too, well... basic? Go Pro! With the Zwap Pro plan you’ll have everything you need to scale up your network and career",
          "price": 8,
          "is_current_plan": true,
          "features": [
            {"name": "Unlimited AI powered match", "enabled": true},
            {"name": "2 Super Intro a week", "enabled": true},
            {"name": "New Top Picks every day", "enabled": true},
            {"name": "Store up to 100 contacts", "enabled": true}
          ]
        },
        {
          "id": 3,
          "title": "Legendary 💫",
          "description":
              "Who’s the legend? You are! Oh yeah! This one is for everyone who wants all of what Zwap has to offer without any limitations!",
          "price": 15,
          "is_current_plan": false,
          "features": [
            {"name": "Unlimited AI powered match", "enabled": true},
            {"name": "5 Super Intro a week", "enabled": true},
            {"name": "New Top Picks every day", "enabled": true},
            {"name": "Unlimited stored contacts", "enabled": true}
          ]
        }
      ],
      "monthly": [
        {
          "id": 4,
          "title": "Basic Month ⭐️",
          "description":
              "A great way to get started with Zwap and experience all of the buttery smooth goodness. Free forever. Not too shabby eh?",
          "price": 0,
          "is_current_plan": false,
          "features": [
            {"name": "Unlimited random matches", "enabled": true},
            {"name": "Store up to 20 contacts", "enabled": true},
            {"name": "Unlimited matches", "enabled": false},
            {"name": "5 Super Intro a week", "enabled": false}
          ]
        },
        {
          "id": 5,
          "title": "Pro Month ✨",
          "description":
              "Is basic a bit too, well... basic? Go Pro! With the Zwap Pro plan you’ll have everything you need to scale up your network and career",
          "price": 8,
          "is_current_plan": true,
          "features": [
            {"name": "Unlimited AI powered match", "enabled": true},
            {"name": "2 Super Intro a week", "enabled": true},
            {"name": "New Top Picks every day", "enabled": true},
            {"name": "Store up to 100 contacts", "enabled": true}
          ]
        },
        {
          "id": 6,
          "title": "Legendary Month 💫",
          "description":
              "Who’s the legend? You are! Oh yeah! This one is for everyone who wants all of what Zwap has to offer without any limitations!",
          "price": 15,
          "is_current_plan": false,
          "features": [
            {"name": "Unlimited AI powered match", "enabled": true},
            {"name": "5 Super Intro a week", "enabled": true},
            {"name": "New Top Picks every day", "enabled": true},
            {"name": "Unlimited stored contacts", "enabled": true}
          ]
        }
      ]
    }).toDomain;
  }
}