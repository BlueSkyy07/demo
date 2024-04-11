import 'package:demo/values/app_assets.dart';
import 'package:flutter/material.dart';

Widget AttributeProfile(
    {required String icon,
    required String attribute,
    required String data,
    required VoidCallback onTap}) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Row(
            children: [
              Container(height: 20, width: 20, child: Image.asset(icon)),
              SizedBox(width: 10),
              Text(
                attribute,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        // Container(
        //   child: Row(
        //     children: [
        //       Text(
        //         data,
        //         style: TextStyle(fontSize: 15),
        //       ),
        //       SizedBox(width: 5),
        //       InkWell(
        //           onTap: onTap,
        //           child: Container(
        //             height: 40,
        //             width: 30,
        //             child: Image.asset(
        //               AppAssets.next,
        //             ),
        //           )),
        //     ],
        //   ),
        // ),
        InkWell(
            onTap: onTap,
            child: Container(
                child: Row(
              children: [
                Text(
                  data,
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  width: 10,
                ),
                Image.asset(
                  AppAssets.next,
                ),
              ],
            ))),
      ],
    ),
  );
}

Widget AttributeAccount(
    {required String icon, required String text, required VoidCallback onTap}) {
  return Container(
    height: 50,
    child: InkWell(
        onTap: onTap,
        child: Container(
          // height: 30,
          child: Row(
            children: [
              Container(
                height: 20,
                width: 20,
                child: Image.asset(icon),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                child: Text(
                  "$text",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        )),
  );
}
