import 'package:fashion_store/core.dart';
import 'package:fashion_store/models/cart_model.dart';
import 'package:fashion_store/pages/home/cart_page.dart';
import 'package:fashion_store/pages/home/home_view.dart';
import 'package:fashion_store/services/cloth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swipe_up/swipe_up.dart';

class DetailPage extends StatefulWidget {
  MenClothes clothes;
  List list;
  DetailPage({this.clothes, this.list});

  @override
  _DetailPageState createState() => _DetailPageState();
}

List<CartModel> merykapry = List<CartModel>();

class _DetailPageState extends State<DetailPage> {
  ClothService clothServiceObj = new ClothService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height / 5,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Sub Total",
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "\$69.95",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          merykapry.add(CartModel(
                              image: widget.clothes.image,
                              title: "Forecast",
                              price: "\$2500",
                              size: "L"));
                          Get.to(() => CartPage());
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height / 14,
                          width: MediaQuery.of(context).size.width / 3,
                          decoration: BoxDecoration(
                            color: Colors.orangeAccent,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            "Add to Cart",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 1.25,
              color: Colors.black.withOpacity(0.5),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.clothes.image),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(35),
                    bottomLeft: Radius.circular(35),
                  ),
                ),
              ),
            ),
            SwipeUp(
              sensitivity: 0.5,
              onSwipe: () {
                Get.to(() => HomeView());
              },
              body: Positioned(
                left: MediaQuery.of(context).size.width / 4,
                bottom: 120,
                child: Column(
                  children: [
                    Icon(Icons.keyboard_arrow_up,
                        color: Colors.white, size: 30),
                    Text(
                      "Swipe up for Details",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
              child: Text("data"),
            ),
            Positioned(
              right: 0,
              bottom: 180,
              child: Container(
                  height: MediaQuery.of(context).size.height / 1.8,
                  width: MediaQuery.of(context).size.width / 4,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            itemCount: widget.list.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 8.3),
                                child: Container(
                                  height: 70,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: widget.clothes.id ==
                                                widget.list[index].id
                                            ? Colors.orange
                                            : Colors.transparent,
                                        width: 2),
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image:
                                          AssetImage(widget.list[index].image),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                      )
                    ],
                  )),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.clothes.isLike = !widget.clothes.isLike;
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          child: Icon(
                            Icons.favorite,
                            color: widget.clothes.isLike
                                ? Colors.red
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
