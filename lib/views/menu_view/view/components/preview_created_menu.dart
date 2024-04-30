part of '../menu_view.dart';

class PreviewCreatedMenu extends StatelessWidget {
  final MenuViewModel viewModel;
  const PreviewCreatedMenu({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 170,
              height: 170,
              decoration: BoxDecoration(
                  color: ColorConsts.instance.background,
                  borderRadius: RadiusConsts.instance.circularAll20,
                  image: DecorationImage(
                      image: MemoryImage(
                        viewModel.menuImage!,
                      ),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 150,
              child: ListTile(
                title: Text(
                  viewModel.menuName.text,
                  style: TextConsts.instance.regularWhite20Bold,
                ),
                subtitle: Text(
                  "${viewModel.menuPrice.text}₺",
                  style: TextConsts.instance.regularWhite16,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 300,
          child: ListTile(
            leading: Text(
              "İçerik: ",
              style: TextConsts.instance.regularWhite16Bold,
            ),
            //TODO: resize as responsive
            title: SizedBox(
              width: 280,
              child: Text(viewModel.menuContent.text,
                  style: TextConsts.instance.regularWhite16),
            ),
          ),
        ),
      ],
    );
  }
}
