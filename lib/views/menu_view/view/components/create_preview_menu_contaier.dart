part of '../menu_view.dart';

class CreatePreviewMenContainer extends StatelessWidget {
  final MenuViewModel viewModel;
  const CreatePreviewMenContainer({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      padding: PaddingConsts.instance.all20,
      decoration: BoxDecoration(
        color: ColorConsts.instance.lightThird,
        borderRadius: RadiusConsts.instance.circularAll20,
        boxShadow: ColorConsts.instance.shadow,
      ),
      child: Observer(builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            viewModel.createOrPreviewMenuWidget,
            Padding(
              padding: PaddingConsts.instance.top40,
              child: buildButtons(),
            ),
          ],
        );
      }),
    );
  }

  Widget buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Observer(builder: (context) {
          return CustomButton(
            width: 160,
            height: 50,
            onPressed: () => viewModel.changeBetweenPreviewAndCreate(viewModel),
            style: TextConsts.instance.regularWhite20,
            text: viewModel.createOrPreviewMenuButtonText,
          );
        }),
        CustomStateFullButton(
          width: 160,
          height: 50,
          onPressed: () {},
          style: TextConsts.instance.regularWhite20,
          text: "Oluştur",
        ),
      ],
    );
  }
}
