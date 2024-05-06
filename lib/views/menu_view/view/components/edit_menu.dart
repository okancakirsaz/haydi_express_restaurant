part of '../menu_view.dart';

class EditMenu extends StatefulWidget {
  final MenuViewModel viewModel;
  final MenuModel data;
  const EditMenu({super.key, required this.viewModel, required this.data});

  @override
  State<EditMenu> createState() => _EditMenuState();
}

class _EditMenuState extends State<EditMenu> {
  @override
  void initState() {
    widget.viewModel.initEditMenuDialog(widget.data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: Column(
        children: <Widget>[
          CustomTextField(
            controller: widget.viewModel.menuName,
            hint: "Menü Adı",
          ),
          CustomTextField(
            controller: widget.viewModel.menuPrice,
            hint: "Ücret",
            customInputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          CustomTextField(
            controller: widget.viewModel.menuContent,
            hint: "İçerik",
          ),
          Padding(
            padding: PaddingConsts.instance.top10,
            child: Row(
              children: <Widget>[
                CustomStateFullButton(
                  onPressed: () async => await widget.viewModel.pickImage(),
                  text: "Fotoğrafı Değiştir",
                  width: 150,
                  height: 50,
                  style: TextConsts.instance.regularWhite16,
                ),
                Padding(
                  padding: PaddingConsts.instance.left10,
                  child: Observer(builder: (context) {
                    return Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: ColorConsts.instance.background,
                        borderRadius: RadiusConsts.instance.circularAll10,
                        image: DecorationImage(
                          image: widget.viewModel.editMenuImage!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
          Padding(
            padding: PaddingConsts.instance.top20,
            child: CustomStateFullButton(
              onPressed: () async =>
                  await widget.viewModel.editMenu(widget.data),
              width: 150,
              height: 50,
              style: TextConsts.instance.regularWhite16,
              text: "Onayla",
            ),
          ),
        ],
      ),
    );
  }
}
