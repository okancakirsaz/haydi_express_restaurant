part of '../stats_view.dart';

class OldBillings extends StatelessWidget {
  final StatsViewModel viewModel;
  const OldBillings({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BillingModel>>(
      future: viewModel.getOldBillings(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            width: 270,
            child: SingleChildScrollView(
              child: Table(
                border: TableBorder.all(),
                children: _buildTableElements(snapshot.data!),
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: ColorConsts.instance.primary,
            ),
          );
        }
      },
    );
  }

  TableRow _buildTableTitles() {
    final TextStyle style = TextConsts.instance.regularBlack14Bold;
    return TableRow(children: <Widget>[
      Text(
        "Tarih",
        textAlign: TextAlign.center,
        style: style,
      ),
      Text(
        "Miktar",
        textAlign: TextAlign.center,
        style: style,
      ),
    ]);
  }

  List<TableRow> _buildTableElements(List<BillingModel> data) {
    final TextStyle style = TextConsts.instance.regularBlack14;
    List<TableRow> table = [_buildTableTitles()];
    for (int i = 0; i <= data.length - 1; i++) {
      table.add(TableRow(children: [
        Text(
          viewModel.parseIso8601DateFormat(data[i].date),
          textAlign: TextAlign.center,
          style: style,
        ),
        Text(
          "${data[i].amount}₺",
          textAlign: TextAlign.center,
          style: style,
        ),
      ]));
    }
    return table;
  }
}
