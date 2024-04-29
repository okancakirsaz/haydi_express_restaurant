part of "../sign_up_view.dart";

class PreviousAndNextButtons extends StatelessWidget {
  final Widget previousPage;
  final int currentIndex;
  final Widget nextPage;
  final SignUpViewModel viewModel;
  final VoidCallback? customFunctionToNext;
  const PreviousAndNextButtons(
      {super.key,
      required this.previousPage,
      required this.nextPage,
      required this.viewModel,
      required this.currentIndex,
      this.customFunctionToNext});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CustomButton(
            onPressed: () => viewModel.goToPage(previousPage,
                viewModel.titles[currentIndex - 1], currentIndex - 1, false),
            text: "Önceki Sayfa"),
        CustomStateFullButton(
            onPressed: customFunctionToNext ??
                () => viewModel.goToPage(nextPage,
                    viewModel.titles[currentIndex + 1], currentIndex + 1, true),
            text: "Devam Et"),
      ],
    );
  }
}
