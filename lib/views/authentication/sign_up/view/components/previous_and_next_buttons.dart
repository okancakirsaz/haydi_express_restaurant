part of "../sign_up_view.dart";

class PreviousAndNextButtons extends StatelessWidget {
  final Widget previousPage;
  final int previousIndex;
  final int nextIndex;
  final Widget nextPage;
  final SignUpViewModel viewModel;
  const PreviousAndNextButtons(
      {super.key,
      required this.previousPage,
      required this.nextPage,
      required this.viewModel,
      required this.previousIndex,
      required this.nextIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CustomButton(
            onPressed: () => viewModel.goToPage(previousPage,
                viewModel.titles[previousIndex], previousIndex, false),
            text: "Önceki Sayfa"),
        CustomButton(
            onPressed: () => viewModel.goToPage(
                nextPage, viewModel.titles[nextIndex], nextIndex, true),
            text: "Devam Et"),
      ],
    );
  }
}
