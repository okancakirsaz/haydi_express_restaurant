part of "../sign_up_view.dart";

class PreviousAndNextButtons extends StatelessWidget {
  final Widget previousPage;
  final int currentIndex;
  final SignUpViewModel viewModel;
  final VoidCallback customFunctionToNext;
  final String? nextText;
  const PreviousAndNextButtons({
    super.key,
    required this.previousPage,
    required this.viewModel,
    required this.currentIndex,
    required this.customFunctionToNext,
    this.nextText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CustomButton(
            height: 50,
            onPressed: () => viewModel.goToPage(previousPage,
                viewModel.titles[currentIndex - 1], currentIndex - 1, false),
            text: "Önceki Sayfa"),
        CustomStateFullButton(
            onPressed: customFunctionToNext, text: nextText ?? "Devam Et"),
      ],
    );
  }
}
