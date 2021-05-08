import 'package:fashion_store/pages/home/detail_page.dart';
import 'package:fashion_store/services/cloth_service.dart';
import 'package:fashion_store/shared/widgets/build_appbar.dart';
import 'package:fashion_store/shared/widgets/build_container_list.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;
  ClothService clothServiceObj = new ClothService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: Container(
        height: 60,
        color: Colors.black,
        child: Row(
          children: [
            buildNavItem(Icons.home, 0),
            buildNavItem(Icons.person, 1),
            buildNavItem(Icons.settings, 2),
            buildNavItem(Icons.account_balance_wallet, 3),
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(35),
            bottomLeft: Radius.circular(35),
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildAppBar(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Find your",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "match style!",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              buildContainerList(),
              Expanded(
                child: buildGrid(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNavItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        height: selectedIndex == index ? 45 : 20,
        width: MediaQuery.of(context).size.width / 4,
        decoration: BoxDecoration(
          color:
              selectedIndex == index ? Colors.orangeAccent : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: selectedIndex == index ? Colors.grey[50] : Colors.grey,
          size: selectedIndex == index ? 28 : 25,
        ),
      ),
    );
  }

  Widget buildGrid() {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: clothServiceObj.clothes.length,
      itemBuilder: (BuildContext context, int index) => Padding(
        padding: const EdgeInsets.all(15),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => DetailPage(
                            clothes: clothServiceObj.clothes[index],
                            list:clothServiceObj.clothes,
                          ));
                    },
                    child: Container(
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        image: DecorationImage(
                          image:
                              AssetImage(clothServiceObj.clothes[index].image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      clothServiceObj.clothes[index].isLike = true;
                      print(clothServiceObj.clothes[index].isLike);
                    });
                  },
                  child: Text(
                    "${ClothService().clothes[index].brand}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "${ClothService().clothes[index].price}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
            Positioned(
              top: 5,
              right: 23,
              child: GestureDetector(
                onTap: () {
                  // controller.onSingleTap(index);
                  setState(() {
                    clothServiceObj.clothes[index].isLike =
                        !clothServiceObj.clothes[index].isLike;
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
                    color: clothServiceObj.clothes[index].isLike
                        ? Colors.red
                        : Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 3.5 : 2.5),
      mainAxisSpacing: 3.0,
      crossAxisSpacing: 3.0,
    );
  }
}
