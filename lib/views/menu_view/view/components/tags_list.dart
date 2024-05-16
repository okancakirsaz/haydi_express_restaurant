part of '../menu_view.dart';

// ignore: must_be_immutable
class TagsList extends StatefulWidget {
  final MenuViewModel viewModel;
  bool? isEditable;
  final List dataSet;
  TagsList(
      {super.key,
      required this.viewModel,
      this.isEditable,
      required this.dataSet});

  @override
  State<TagsList> createState() => _TagsListState();
}

class _TagsListState extends State<TagsList> {
  @override
  void initState() {
    widget.isEditable == null ? widget.isEditable = true : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisExtent: 50),
        itemCount: widget.dataSet.length,
        itemBuilder: (context, index) {
          return Chip(
            onDeleted: () =>
                widget.isEditable! ? widget.viewModel.deleteTag(index) : null,
            label: Text(
              widget.dataSet[index],
              style: TextConsts.instance.regularBlack12,
            ),
            deleteIcon: !widget.isEditable! ? const SizedBox() : null,
          );
        },
      );
    });
  }
}
