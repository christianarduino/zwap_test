import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zwap_pricing/src/price/di/prices_providers.dart';
import 'package:zwap_pricing/src/price/ui/viewmodel/prices_viewmodel.dart';
import 'package:zwap_pricing/src/price/ui/widgets/prices_dialog.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            child: const Text("Show prices"),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => MultiProvider(
                  providers: pricesProviders,
                  builder: (context, __) {
                    final viewModel = context.watch<PricesViewModel>();
                    return PricesDialog(viewModel: viewModel);
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
