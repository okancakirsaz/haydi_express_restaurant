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
                  padding: PaddingConsts.instance.top30,
                  child: CustomStateFullButton(
                    borderRadius: RadiusConsts.instance.circularAll10,
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
            height: 60,
            width: 350,
            child: TagsList(
              viewModel: viewModel,
              dataSet: viewModel.tags,
            ))
      ],
    );
  }
}
