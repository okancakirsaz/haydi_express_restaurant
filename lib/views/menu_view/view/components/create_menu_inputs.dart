part of '../menu_view.dart';

class CreateMenuInputs extends StatelessWidget {
  final MenuViewModel viewModel;
  const CreateMenuInputs({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          width: 350,
          child:
              CustomTextField(controller: viewModel.menuName, hint: "Menü Adı"),
        ),
        SizedBox(
          width: 350,
          child: Row(
            children: <Widget>[
              Expanded(
                child: CustomTextField(
                  controller: viewModel.menuPrice,
                  hint: "Ücret",
                  customInputFormatters: [
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: PaddingConsts.instance.top40,
                  child: CustomStateFullButton(
                    onPressed: () async => await viewModel.pickImage(),
                    text: "Ürün Fotoğrafı\nEkle",
                    style: TextConsts.instance.regularWhite16,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: 350,
          child: CustomTextField(
              controller: viewModel.menuContent, hint: "Menü İçeriği"),
        ),
      ],
    );
  }
}
