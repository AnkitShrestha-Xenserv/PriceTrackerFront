import 'package:flutter/material.dart';
import '../bloc/products_provider.dart';
import 'package:price_tracker/src/components/button.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = ProductsProvider.of(context);
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(
                  left: 25,
                  right: 25,
                  bottom: 36 + 25,
                ),
                color: Colors.blue,
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    Row(
                      children: <Widget>[
                        InkWell(
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                              size: 24,
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            }),
                        Spacer(),
                        Text(
                          "Keen Price Tracker",
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Spacer(),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  SizedBox(height: 20),
                  Text(
                    'Add a Product',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 20),
                  StreamBuilder(
                    stream: bloc.productUrl,
                    builder: (context, snapshot) {
                      return TextField(
                        onChanged: bloc.changeProductUrl,
                        decoration: InputDecoration(
                          hintText: 'Product Url',
                          errorText: snapshot.hasError
                              ? snapshot.error.toString()
                              : "",
                          contentPadding: const EdgeInsets.all(25.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 1.0),
                              borderRadius: BorderRadius.circular(5.0)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2.0),
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 5),
                  StreamBuilder(
                    stream: bloc.threshold,
                    builder: (context, AsyncSnapshot<String> snapshot) {
                      return TextField(
                        onChanged: bloc.changeThresholdPrice,
                        decoration: InputDecoration(
                          errorText: snapshot.hasError
                              ? snapshot.error.toString()
                              : "",
                          hintText: 'Threshold Price',
                          contentPadding: const EdgeInsets.all(25.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 1.0),
                              borderRadius: BorderRadius.circular(5.0)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2.0),
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  StreamBuilder(
                      stream: bloc.submitUrlValid,
                      builder: (context, snapshot) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            minimumSize: const Size.fromHeight(50), // NEW
                          ),
                          onPressed: snapshot.hasData ? bloc.submit : null,
                          child: Text(
                            'Add',
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                        );
                      }),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
