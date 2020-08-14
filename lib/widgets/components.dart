import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../light_color.dart';

Widget phoneNumberTextField(
    TextEditingController _textEditingControllerPhoneNumber,
    {Color borderColor = Colors.grey}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      cursorColor: LightColor.blueHeader,
      keyboardType: TextInputType.phone,
      maxLength: 10,
      controller: _textEditingControllerPhoneNumber,
      validator: (value) {
        if (value.isEmpty)
          return "مطلوب";
        else if (value.length < 10) return "يجب ادخال 10 رقم";
        return null;
      },
      inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly,
      ],
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: borderColor),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: borderColor),
        ),
        hintText: "رقم الهاتف",
        //   hintText: hint,
      ),
    ),
  );
}

Widget inputFormFileadWithoutOutline(TextEditingController controller,
    {IconData iconData = FontAwesomeIcons.user,
    bool secure = false,
    bool enable = true,
    String hint = "",
    TextInputType textInputTyp = TextInputType.text}) {
  return TextFormField(
    controller: controller,
    enabled: enable,
    decoration: InputDecoration(
      labelText: hint,
      prefixIcon: Icon(iconData),
//          enabledBorder: OutlineInputBorder(
//              borderRadius: BorderRadius.circular(10),
//              borderSide: BorderSide(color: Colors.black12, width: 1)),
    ),
    // style: TextStyles.second_title_sans,
    keyboardType: textInputTyp,
    validator: (value) {
      if (value.isEmpty) return "";
      return null;
    },
  );
}

Widget textForm(TextEditingController _textEditingController, String hint,
    {Color borderColor = Colors.transparent,
    TextInputType textInputType = TextInputType.text,
    bool obsecure = false,
    Color cursorColor = LightColor.skyBlue,
    Color labelColor = Colors.grey,
    Color borderColorOutline = Colors.transparent,
    Function function(String value),
    Icon prefixIcon,
    bool req = true,
    double padding = 4.0,
    double verticalMargin = 1,
    double height,
    double radius = 0,
    Color backGroundColor = Colors.transparent,
    double margin = 4.0}) {
  return Container(
    height: height != null ? height : null,
    margin: EdgeInsets.symmetric(horizontal: margin, vertical: verticalMargin),
    padding: EdgeInsets.all(padding),
    decoration: BoxDecoration(
        color: backGroundColor,
        border: Border.all(width: 1, color: borderColorOutline),
        borderRadius: BorderRadius.circular(radius)),
    child: TextFormField(
      style: TextStyle(fontSize: 16),
      cursorColor: cursorColor,
      controller: _textEditingController,
      validator: (value) {
        if (req) if (value.isEmpty) return "مطلوب";
        return null;
      },
      onChanged: (vale) {
        function(vale);
      },
      onFieldSubmitted: (vale) {
        function(vale);
      },
      obscureText: obsecure,
      keyboardType: textInputType,
      decoration: InputDecoration(
          prefixIcon: prefixIcon,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: borderColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: borderColor),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: borderColor),
          ),
          hintText: hint,
          //   hintText: hint,
          labelStyle: TextStyle(color: labelColor)),
    ),
  );
}

Widget photoUrl(String photourl,
    {double elevation = 0,
    double borderRadius = 8,
    Color color = Colors.white,
    double height = 130.0,
    double width = 200,
    BoxFit fit = BoxFit.cover}) {
  return Material(
    color: color,
    elevation: elevation,
    child: (photourl != null && photourl.isNotEmpty)
        ? CachedNetworkImage(
            placeholder: (context, url) => Container(
              child: CircularProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation<Color>(LightColor.pinkHeader),
              ),
              width: width,
              height: height,
              padding: EdgeInsets.all(70.0),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
            ),
            errorWidget: (context, url, error) => Material(
              child: Image.asset(
                'images/img_not_available.jpeg',
                width: width,
                height: height,
                fit: BoxFit.contain,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
              clipBehavior: Clip.hardEdge,
            ),
            imageUrl: photourl,
            width: width,
            height: height,
            fit: fit,
          )
        : Image.asset("assets/images/logo.png"),
    borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
    clipBehavior: Clip.hardEdge,
  );
}

Widget photoUrlWithoutBorder(String photourl,
    {BoxFit boxFit = BoxFit.contain,
    double height = 130.0,
    double width = 200}) {
  return (photourl != null && photourl.isNotEmpty)
      ? CachedNetworkImage(
          placeholder: (context, url) => Container(
            child: CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation<Color>(Colors.yellowAccent.shade700),
            ),
            width: width,
            height: height,
            padding: EdgeInsets.all(70.0),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
          ),
          errorWidget: (context, url, error) => Material(
            child: Image.asset(
              'assets/images/nf2.png',
              width: width,
              height: height,
              fit: BoxFit.contain,
            ),
            clipBehavior: Clip.hardEdge,
          ),
          imageUrl: photourl,
          width: width,
          height: height,
          fit: boxFit,
        )
      : Material(
          child: Image.asset(
            'assets/images/nf.png',
            width: width,
            height: height,
            fit: BoxFit.cover,
          ),
          clipBehavior: Clip.hardEdge,
        );
}

Widget photoAssets(String photourl,
    {bool shape = false, double height = 130.0, double width = 200}) {
  return Material(
    shape: (shape)
        ? CircleBorder()
        : RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
          ),
    child: Image.asset(
      photourl,
      width: width,
      height: height,
      fit: BoxFit.cover,
    ),
    clipBehavior: Clip.hardEdge,
  );
}

Widget CirclePhotoUrl(String photourl, {double rad = 50}) {
  return CircleAvatar(
    radius: rad,
    backgroundImage: (photourl != null)
        ? CachedNetworkImageProvider(photourl)
        : AssetImage("assets/images/logo2.png"),
  );
}
