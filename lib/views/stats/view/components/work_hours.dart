part of '../stats_view.dart';

class WorkHours extends StatelessWidget {
  final StatsViewModel viewModel;
  const WorkHours({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Restoran çalışma saatleri:",
          style: TextConsts.instance.regularBlack16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _textField(viewModel.startHour),
            _separator(":"),
            _textField(viewModel.startMinute),
            _separator("-"),
            _textField(viewModel.endHour),
            _separator(":"),
            _textField(viewModel.endMinute),
            Padding(
              padding: PaddingConsts.instance.top20,
              child: SizedBox(
                height: 40,
                child: CustomStateFullButton(
                  width: 100,
                  style: TextConsts.instance.regularWhite14,
                  onPressed: () async => viewModel.setNewWorkHours(),
                  text: "Kaydet",
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _textField(TextEditingController controller) {
    return Container(
      margin: PaddingConsts.instance.all5,
      width: 35,
      child: CustomTextField(
        padding: EdgeInsets.zero,
        maxLength: 2,
        customInputFormatters: [FilteringTextInputFormatter.digitsOnly],
        controller: controller,
        hint: "",
      ),
    );
  }

  Widget _separator(String text) {
    return Padding(
      padding: PaddingConsts.instance.top20,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextConsts.instance.regularBlack16Bold,
      ),
    );
  }
}
