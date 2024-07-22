import 'package:flutter/material.dart';
import 'package:haydi_ekspres_dev_tools/haydi_ekspres_dev_tools.dart';
import '../../../../core/base/view/base_view.dart';
import '../viewmodel/active_ads_viewmodel.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

part './components/boost_element.dart';

class ActiveAdsView extends StatelessWidget {
  const ActiveAdsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<ActiveAdsViewModel>(
        viewModel: ActiveAdsViewModel(),
        onPageBuilder: (context, model) {
          return Center(
            child: Padding(
              padding: PaddingConsts.instance.top30,
              child: FutureBuilder<List<BoostRestaurantOrMenuModel>?>(
                  future: model.getActiveAds(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Observer(builder: (context) {
                        return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                MediaQuery.of(context).size.width <= 1300
                                    ? 3
                                    : 5,
                            childAspectRatio: 2,
                          ),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return BoostElement(
                              boostData: snapshot.data![index],
                              viewModel: model,
                            );
                          },
                        );
                      });
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          color: ColorConsts.instance.primary,
                        ),
                      );
                    }
                  }),
            ),
          );
        },
        onModelReady: (model) {
          model.init();
          model.setContext(context);
        },
        onDispose: (model) {});
  }
}
