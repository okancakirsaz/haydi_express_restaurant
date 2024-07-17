part of '../create_order_view.dart';

class MenuSelectPart extends StatelessWidget {
  final CreateOrderViewModel viewModel;
  const MenuSelectPart({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 383,
      height: 520,
      margin: PaddingConsts.instance.horizontal10,
      padding: PaddingConsts.instance.all10,
      decoration: BoxDecoration(
        color: ColorConsts.instance.lightThird,
        boxShadow: ColorConsts.instance.shadow,
        borderRadius: RadiusConsts.instance.circularAll40,
      ),
      child: Column(
        children: [
          Padding(
            padding: PaddingConsts.instance.all20,
            child: SearchBar(
              leading: Icon(
                Icons.search,
                color: ColorConsts.instance.background,
                size: 28,
              ),
              onChanged: (q) => viewModel.filterMenu(q),
              hintText: "Menü Adı",
              textStyle:
                  MaterialStatePropertyAll(TextConsts.instance.regularBlack14),
              hintStyle: MaterialStatePropertyAll(
                  TextConsts.instance.regularLightGrey14),
              backgroundColor:
                  MaterialStatePropertyAll(ColorConsts.instance.blurGrey),
              elevation: const MaterialStatePropertyAll(0),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: RadiusConsts.instance.circularAll10,
                ),
              ),
              controller: null,
            ),
          ),
          FutureBuilder<List<MenuModel>>(
            future: viewModel.getRestaurantMenu(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: Observer(builder: (context) {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.75,
                        crossAxisCount: 2,
                      ),
                      itemCount: viewModel.menu.length,
                      itemBuilder: (context, i) {
                        return VerticalListMinimizedMenu(
                          data: viewModel.menu[i],
                          calculatedDiscountedPrice:
                              viewModel.menu[i].isOnDiscount
                                  ? viewModel.calculateDiscount(
                                      viewModel.menu[i].price,
                                      viewModel.menu[i].discountAmount!)
                                  : null,
                          viewModel: viewModel,
                        );
                      },
                    );
                  }),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: ColorConsts.instance.primary,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
