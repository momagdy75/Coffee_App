import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constant.dart';

class ItemBox extends StatefulWidget {
  const ItemBox({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.price,
  }) : super(key: key);

  final String image;
  final String title;
  final String subtitle;
  final String price;

  @override
  State<ItemBox> createState() => _ItemBoxState();
}

class _ItemBoxState extends State<ItemBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 186,
      height: 300,
      decoration: BoxDecoration(
        color: boxoneColor,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                image: AssetImage("${widget.image}"),
                width: 126,
                height: 130,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "${widget.title}",
              style: GoogleFonts.kalam(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,

              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 4),
            child: Text(
              "${widget.subtitle}",
              style: GoogleFonts.kalam(
                  color: boxtwoColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "${widget.price}",
                  style: GoogleFonts.kalam(
                    color: priceColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,

                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: IconButton(onPressed:
                (){

                }


                , icon: Icon(Icons.add_circle,color:addColor,size: 32,)),
              )
            ],
          )
        ],
      ),
    );
  }
}