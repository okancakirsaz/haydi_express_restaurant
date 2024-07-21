import 'package:flutter/material.dart';
import 'package:haydi_ekspres_dev_tools/constants/constants_index.dart';
import 'package:haydi_express_restaurant/core/widgets/custom_scaffold.dart';
import 'package:haydi_express_restaurant/core/widgets/part_title.dart';
import '../../../../core/base/view/base_view.dart';
import '../viewmodel/adversiment_parent_viewmodel.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AdvertisementParentView extends StatelessWidget {
  const AdvertisementParentView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<AdvertisementParentViewModel>(
        viewModel: AdvertisementParentViewModel(),
        onPageBuilder: (context, model) {
          return CustomScaffold(
            appBar: AppBar(
              elevation: 0,
              centerTitle: false,
              backgroundColor: Colors.transparent,
              title: const PartTitle(
                title: "Öne Çıkarma",
                subtitle: "Seçenekler",
              ),
            ),
            body: Row(
              children: <Widget>[
                Padding(
                  padding: PaddingConsts.instance.right20,
                  child: _buildPagesBar(model),
                ),
                Observer(builder: (context) {
                  return Expanded(child: Center(child: model.page));
                })
              ],
            ),
          );
        },
        onModelReady: (model) {
          model.init();
          model.setContext(context);
        },
        onDispose: (model) {});
  }

  Widget _buildPagesBar(AdvertisementParentViewModel model) {
    return Container(
      height: double.infinity,
      width: 102,
      decoration: BoxDecoration(
        boxShadow: ColorConsts.instance.shadow,
        color: ColorConsts.instance.third,
        borderRadius: RadiusConsts.instance.circularRight100,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: PaddingConsts.instance.all5,
            child: _buildButton(
              0,
              AssetConsts.instance.addAdvertisement,
              "Öne Çıkarma Seçenekleri",
              model,
            ),
          ),
          Padding(
            padding: PaddingConsts.instance.all5,
            child: _buildButton(
              1,
              AssetConsts.instance.advertisements,
              "Aktif Öne Çıkarmalar",
              model,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(int index, String assetPath, String desc,
      AdvertisementParentViewModel model) {
    return Observer(builder: (context) {
      return IconButton(
        onPressed: () => model.changePageIndex(index),
        icon: Column(
          children: <Widget>[
            Padding(
              padding: PaddingConsts.instance.bottom5,
              child: SvgPicture.asset(
                width: 25,
                assetPath,
                color: index == model.pageIndex
                    ? ColorConsts.instance.primary
                    : ColorConsts.instance.background,
              ),
            ),
            Text(
              desc,
              style: TextConsts.instance.regularCustomColor11(
                index == model.pageIndex
                    ? ColorConsts.instance.primary
                    : ColorConsts.instance.background,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      );
    });
  }
}
