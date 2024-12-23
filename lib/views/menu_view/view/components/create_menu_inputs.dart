part of '../menu_view.dart';

class CreateMenuInputs extends StatelessWidget {
  final MenuViewModel viewModel;
  CreateMenuInputs({super.key, required this.viewModel});
  final TextStyle inputTitleStyle = TextConsts.instance.regularWhite16;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          width: 350,
          child: CustomTextField(
            controller: viewModel.menuName,
            hint: "Menü Adı",
            hintStyle: inputTitleStyle,
          ),
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
                  hintStyle: inputTitleStyle,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: PaddingConsts.instance.top30,
                  child: CustomStateFullButton(
                    height: 50,
                    onPressed: () async => await viewModel.pickImage(),
                    text: "Ürün Fotoğrafı\nEkle",
                    style: TextConsts.instance.regularWhite16,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 350,
          height: 150,
          child: _buildTagsInput(),
        ),
        SizedBox(
          width: 350,
          child: CustomTextField(
            controller: viewModel.menuContent,
            hint: "Menü İçeriği",
            maxLength: 150,
            hintStyle: inputTitleStyle,
          ),
        ),
      ],
    );
  }

  Widget _buildTagsInput() {
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: CustomTextField(
                style: inputTitleStyle,
                controller: viewModel.tag,
                hint: "Etiket",
                label: "Örn: Makarna, Pide, Ev Yemeği...",
              ),
            ),
            Padding(
              padding: PaddingConsts.instance.top20,
              child: CustomTextButton(
                onPressed: () => viewModel.addTag(),
                style: TextConsts.instance.regularPrimary16,
                text: "Ekle",
              ),
            ),
          ],
        ),
        SizedBox(
            height: 58,
            width: 350,
            child: TagsList(
              viewModel: viewModel,
              dataSet: viewModel.tags,
            ))
      ],
    );
  }
}
