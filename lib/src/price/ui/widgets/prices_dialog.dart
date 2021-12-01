import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:zwap_pricing/src/price/domain/model/price_response_model.dart';
import 'package:zwap_pricing/src/price/domain/model/prices_response_model.dart';
import 'package:zwap_pricing/src/price/ui/viewmodel/prices_viewmodel.dart';
import 'package:zwap_pricing/src/price/ui/widgets/footer_text.dart';
import 'package:zwap_pricing/src/price/ui/widgets/header_dialog.dart';
import 'package:zwap_pricing/src/price/ui/widgets/sub_card.dart';
import 'package:zwap_pricing/src/price/ui/widgets/sub_header_dialog.dart';
import 'package:zwap_pricing/src/price/ui/widgets/subscription_tab.dart';

class PricesDialog extends StatelessWidget {
  final PricesViewModel viewModel;

  const PricesDialog({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        width: double.maxFinite,
        child: Stack(
          children: [
            ScreenTypeLayout(
              desktop: _DesktopView(viewModel: viewModel),
              mobile: _MobileView(viewModel: viewModel),
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MobileView extends StatelessWidget {
  final PricesViewModel viewModel;

  const _MobileView({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const HeaderDialog(),
        const SubHeaderDialog(),
        SubscriptionTab(viewModel: viewModel),
        FutureBuilder<PricesResponseModel>(
          future: viewModel.pricesFuture,
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(snapshot.error.toString()),
                  ),
                );
              }

              final bothPrices = snapshot.data!;
              late List<PriceResponseModel> prices;

              if (viewModel.isAnnualSelected) {
                prices = bothPrices.annual;
              } else {
                prices = bothPrices.monthly;
              }

              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 16),
                itemCount: prices.length,
                itemBuilder: (_, int i) {
                  final sub = prices[i];
                  bool isSelected = i == viewModel.selectedSubIndex;
                  return SubCard(
                    isSelected: isSelected,
                    planIndex: i,
                    sub: sub,
                    currentPlanIndex: viewModel.currentPlanIndex,
                    onTap: () => viewModel.onSubTap(i),
                  );
                },
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        const Center(child: FooterText()),
      ],
    );
  }
}

class _DesktopView extends StatelessWidget {
  final PricesViewModel viewModel;

  const _DesktopView({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const HeaderDialog(),
        const SubHeaderDialog(),
        SubscriptionTab(viewModel: viewModel),
        if (viewModel.pricesFuture != null)
          Expanded(
            child: FutureBuilder<PricesResponseModel>(
              future: viewModel.pricesFuture,
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }

                  final bothPrices = snapshot.data!;
                  late List<PriceResponseModel> prices;

                  if (viewModel.isAnnualSelected) {
                    prices = bothPrices.annual;
                  } else {
                    prices = bothPrices.monthly;
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.only(
                      top: 32,
                      bottom: 32,
                      left: 32,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: prices.length,
                    itemBuilder: (_, int i) {
                      final sub = prices[i];
                      bool isSelected = i == viewModel.selectedSubIndex;
                      return SubCard(
                        isSelected: isSelected,
                        planIndex: i,
                        sub: sub,
                        currentPlanIndex: viewModel.currentPlanIndex,
                        onTap: () => viewModel.onSubTap(i),
                      );
                    },
                  );
                }

                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        const FooterText(),
      ],
    );
  }
}
