import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

import '../light_color.dart';

showPhone(BuildContext context, List<dynamic> items) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(MdiIcons.bicycle, color: Colors.black),
              Text("خدمة التوصيل"),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              for (final item in items)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    color: LightColor.blueHeader,
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.phone, color: Colors.white),
                        Text(item, style: TextStyle(color: Colors.white))
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    onPressed: () {
                      launch("tel://$item");
                    },
                  ),
                )
            ],
          ),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child:
                    Text("الغاء", style: TextStyle(color: LightColor.skyBlue)))
          ],
        );
      });
}

Future<dynamic> ShowDialog(BuildContext context, bool isConfirm,
    VoidCallback btnCanel, VoidCallback btnOk) {
  showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text("هل انت متاكد ؟"),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text("تاكيد"),
              onPressed: btnOk,
              textStyle: TextStyle(color: LightColor.blueHeader),
            ),
            CupertinoDialogAction(
              child: Text("الغاء"),
              onPressed: btnCanel,
              textStyle: TextStyle(color: LightColor.blueHeader),
            ),
          ],
//      content: Row(
//
//        children: <Widget>[
//
//        ],
//      ),
        );
      });
}

showProgressDialog(BuildContext context) async {
  ProgressDialog pr = ProgressDialog(
    context,
    type: ProgressDialogType.Normal,
    isDismissible: false,
  );
  pr.style(
      message: 'انتظر قليلا',
      borderRadius: 10.0,
      backgroundColor: Colors.white,
      progressWidget: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(LightColor.pinkHeader),
        ),
      ),
      elevation: 10.0,
      insetAnimCurve: Curves.easeInOut,
      padding: EdgeInsets.all(10),
      progressTextStyle: TextStyle(
          color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
      messageTextStyle: TextStyle(
          color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600));

  pr.show();
}
