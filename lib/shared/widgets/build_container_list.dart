import 'package:fashion_store/pages/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

 Widget buildContainerList() {
  return GetBuilder<MainController>(
    builder: (controller) {
      return Container(
        height: 70,
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.textlist.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  controller.changeColor(index);
                },
                child: Container(
                  width: 140,
                  decoration: BoxDecoration(
                    color: controller.isSelected == index
                        ? Colors.black
                        : Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    border: Border.all(color: Colors.grey)
                  ),
                  child: Center(
                    child: Text(
                      controller.textlist[index],
                      style: TextStyle(
                        fontSize: controller.isSelected == index
                            ? 17:15,
                        color: controller.isSelected == index
                            ? Colors.white
                            : Colors.grey[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
    },
  );
}
