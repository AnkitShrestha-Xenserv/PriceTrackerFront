import 'package:flutter/material.dart';

class ViewProduct extends StatelessWidget {
  ViewProduct({Key? key}) : super(key: key);

  final items = [
    'Acer helios',
    'MSI GF63',
    'Lenovo Legion',
    'Dell G15',
    'Ripple',
    'Hp Omen 15'
  ];

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return CustomListTile(context, items[index]);
            }),
      ),
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
                          '${item}',
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
                        CustomInfo('Track Date', '2023/01/05'),
                        CustomInfo('Previous Price', '130,000'),
                        CustomInfo('Updated Date', '2023/01/10'),
                        CustomInfo('Current Price', '125,000'),
                        CustomInfo('Threshold', '120,000'),
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
