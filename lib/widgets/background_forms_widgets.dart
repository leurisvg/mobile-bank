import 'package:flutter/material.dart';
import 'dart:math' as math;

class SquareForm extends StatelessWidget {
  final double height;
  final double width;
  final Color squareColor;
  final Color circleColor;
  final Color centerSquareColor;
  final bool centerSquare;
  final double circlePadding;
  final double centerSquarePadding;

  const SquareForm({
    @required this.height,
    @required this.width,
    this.centerSquare = false,
    this.squareColor = Colors.white,
    this.circleColor = Colors.blue,
    this.centerSquareColor = Colors.green,
    this.circlePadding = 10,
    this.centerSquarePadding = 20
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: math.pi / 4,
      child: Container(
        height: this.height,
        width: this.width,
        color: this.squareColor,
        child: Container(
          margin: EdgeInsets.all(this.circlePadding),
          decoration: BoxDecoration(
            color: this.circleColor,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Builder(
            builder: (BuildContext context) {
              if (this.centerSquare) {
                return Container(
                  margin: EdgeInsets.all(this.centerSquarePadding),
                  decoration: BoxDecoration(
                    color: this.centerSquareColor
                  ),
                );
              }
              return SizedBox.shrink();
            },
          )
        ),
      ),
    );
  }
}

class CircleForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: size.width * 0.65,
      width: size.width * 0.65,
      decoration: BoxDecoration(
          color: Color(0xff5368a1),
          borderRadius: BorderRadius.circular(200)
      ),
      child: Container(
        margin: EdgeInsets.all(75),
        color: Colors.white,
      ),
    );
  }
}

class RoundedSquareForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Stack(
      children: <Widget>[
        Container(
          width: size.width * 0.5,
          height: size.height * 0.2,
          decoration: BoxDecoration(
            color: Color(0xffecbec0),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(150))
          ),
        ),
        Positioned(
          top: 25,
          right: 25,
          child: Container(
            width: size.width * 0.24,
            height: size.width * 0.24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.white
            ),
            child: Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Color(0xff5368a1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
