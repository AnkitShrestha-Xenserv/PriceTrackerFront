import 'package:flutter/material.dart';
import '../bloc/products_provider.dart';
import '../models/user_model.dart';
import '../models/item_model.dart';

class ViewProduct extends StatelessWidget {
  ViewProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _bloc = ProductsProvider.of(context);
    print(_bloc.fetchProducts());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Keen Price Tracker',
        ),
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: StreamBuilder(
          stream: _bloc.products,
          builder: (context, AsyncSnapshot<List<ItemModel>> snapshot) {
            if (!snapshot.hasData) {
              return Text('Still Loading Data');
            } else if (snapshot.hasError) {
              return Text("Error loading");
            } else if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CustomListTile(context, snapshot.data![index]);
                  });
            }
            return Text('Loading Data');
          }),
    );
  }

  Widget CustomListTile(context, item) {
    Size size = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 0.1,
                color: Colors.black45,
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          height: size.width * 0.3,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${item.productName}',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        CircleAvatar(
                          child: Icon(Icons.link),
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(1)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomInfo('Track Date', '${item.previousDate}'),
                        CustomInfo('Previous Price', '${item.previousPrice}'),
                        CustomInfo('Updated Date', '${item.currentDate}'),
                        CustomInfo('Current Price', '${item.currentPrice}'),
                        CustomInfo('Threshold', '${item.thresholdPrice}'),
                      ],
                    ),
                  ),
                ]),
          ),
        ));
  }

  Widget CustomInfo(text, info) {
    return Container(
      height: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('${text}',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
              )),
          Text('${info}',
              style: TextStyle(
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}
