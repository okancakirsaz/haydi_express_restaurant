import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haydi_ekspres_dev_tools/constants/constants_index.dart';
import 'package:haydi_ekspres_dev_tools/haydi_ekspres_dev_tools.dart';
import 'package:haydi_ekspres_dev_tools/models/billing_model.dart';
import 'package:haydi_ekspres_dev_tools/widgets/custom_scaffold.dart';
import 'package:haydi_ekspres_dev_tools/widgets/stat_container.dart';
import 'package:haydi_express_restaurant/views/stats/viewmodel/stats_viewmodel.dart';
import '../../../../core/base/view/base_view.dart';

part './components/work_hours.dart';
part 'components/billings.dart';
part 'components/old_billings.dart';

class StatsView extends StatelessWidget {
  const StatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<StatsViewModel>(
        viewModel: StatsViewModel(),
        onPageBuilder: (context, model) {
          return CustomScaffold(
              body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _title("İşletme Detayları"),
                  WorkHours(
                    viewModel: model,
                  ),
                  _title("Ödemeler"),
                  Billings(
                    viewModel: model,
                  ),
                  _title("Geçmiş Ödemeler"),
                  OldBillings(
                    viewModel: model,
                  ),
                ],
              )
            ],
          ));
        },
        onModelReady: (model) {
          model.init();
          model.setContext(context);
        },
        onDispose: (model) {});
  }

  Widget _title(String text) {
    return Padding(
      padding: PaddingConsts.instance.all10,
      child: Text(
        text,
        style: TextConsts.instance.regularBlack16Bold,
      ),
    );
  }
}
