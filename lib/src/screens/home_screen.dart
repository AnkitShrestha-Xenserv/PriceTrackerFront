import 'package:flutter/material.dart';
import '../../../constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                left: kDefaultPadding,
                right: kDefaultPadding,
                bottom: 36 + kDefaultPadding,
              ),
              height: size.height * 0.4,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(200),
                  bottomRight: Radius.circular(200),
                ),
              ),
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
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Spacer(),
                      //Image.asset("assets/images/logo.png"),
                    ],
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.only(
                      left: kDefaultPadding,
                      right: kDefaultPadding,
                      bottom: 36 + kDefaultPadding,
                    ),
                    alignment: Alignment.topLeft,
                    height: size.height * 0.2,
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Ankit Shrestha',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Spacer(),
                            Text(
                              'Total Tracked Products: 30',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300,
                                  ),
                            ),
                            Text(
                              'Total Searches: 50',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300,
                                  ),
                            ),
                            Spacer(),
                          ],
                        ),
                        Expanded(
                            child: CircleAvatar(
                          radius: 50,
                          child: Image.asset('assets/icons/avatar.png'),
                        ))
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
                top: size.height * 0.25,
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Wrap(
                      children: [
                        menuCard(context, size, 'Add Product',
                            Icon(Icons.add, size: 50),
                            route: '/'),
                        menuCard(context, size, 'View Product',
                            Icon(Icons.shopping_cart, size: 40),
                            route: '/view_products'),
                        menuCard(context, size, 'Personal Info',
                            Icon(Icons.account_circle, size: 60)),
                        menuCard(context, size, 'Settings',
                            Icon(Icons.settings, size: 30)),
                        menuCard(context, size, 'Notification',
                            Icon(Icons.notifications, size: 30)),
                      ],
                    ))),
          ],
        ),
      ),
    );
  }

  Padding menuCard(context, Size size, text, Icon icon, {route = '/'}) {
    return Padding(
        padding: const EdgeInsets.all(25.0),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, route);
          },
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 0.1,
                  color: Colors.black45,
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            width: size.width * 0.35,
            height: size.width * 0.3,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(child: icon, radius: 40),
                    Text(text,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400)),
                  ]),
            ),
          ),
        ));
  }
}
