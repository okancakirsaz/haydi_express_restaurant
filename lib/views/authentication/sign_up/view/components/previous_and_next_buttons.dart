part of "../sign_up_view.dart";

class PreviousAndNextButtons extends StatelessWidget {
  final Widget previousPage;
  final String previousTitle;
  final String nextTitle;
  final Widget nextPage;
  final SignUpViewModel viewModel;
  const PreviousAndNextButtons(
      {super.key,
      required this.previousPage,
      required this.nextPage,
      required this.viewModel,
      required this.previousTitle,
      required this.nextTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CustomButton(
            onPressed: () => viewModel.goNextPage(previousPage, previousTitle),
            text: "Önceki Sayfa"),
        CustomButton(
            onPressed: () => viewModel.goNextPage(nextPage, nextTitle),
            text: "Devam Et"),
      ],
    );
  }
}
