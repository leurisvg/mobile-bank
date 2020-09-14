import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:google_fonts/google_fonts.dart';

import 'package:mobile_bank/widgets/background_forms_widgets.dart';

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _Background(),
          Positioned(
            bottom: 0,
            left: 0,
            child: _HomeCard()
          ),
          _SkipButton()
        ],
      )
    );
  }
}

class _SkipButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: SizedBox(
              width: 70,
              child: FlatButton(
                splashColor: Colors.white.withOpacity(0.2),
                highlightColor: Colors.white.withOpacity(0.2),
                onPressed: () => Navigator.pushNamed(context, 'home'),
                child: Text(
                  'Skip',
                  style: GoogleFonts.playfairDisplay(
                    color: Colors.white,
                    fontSize: 17
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

    return Stack(
      children: <Widget>[
        CustomPaint(
          painter: _BackgroundPainter(),
          child: Container(
            height: double.infinity,
            width: double.infinity,
          ),
        ),
        Positioned(
          top: size.height * 0.06,
          left: size.width * 0.11,
          child: SquareForm(
            height: size.width * 0.12,
            width: size.width * 0.12,
            centerSquare: true,
            circlePadding: 8,
            centerSquarePadding: 10,
            centerSquareColor: Colors.white,
            circleColor: Color(0xff5368a1),
          )
        ),
        Positioned(
          top: size.height * 0.236,
          right: size.width * 0.24,
          child: SquareForm(
            height: size.width * 0.2,
            width: size.width * 0.2,
            circlePadding: 22,
            circleColor: Colors.white,
            squareColor: Color(0xff5368a1),
          )
        ),
        Positioned(
          top: size.height * 0.24,
          left: - size.width * 0.32,
          child: CircleForm(),
        ),
        Positioned(
          top: size.height * 0.5,
          right: 0,
          child: RoundedSquareForm(),
        )
      ],
    );
  }
}

class _BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();
    Path path = new Path();

    final quartHeightScreen = size.height * 0.285;
    final thirthWidthScreen = size.width * 0.66;

    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2.0;

    paint.color = Color(0xffe3a5a8);

    path.moveTo(size.width * 0.07, 0);
    path.lineTo(thirthWidthScreen, quartHeightScreen);
    path.lineTo(0, quartHeightScreen);
    path.lineTo(0, 0);
    path.close();

    canvas.drawPath(path, paint);

    path = new Path();
    paint.color = Color(0xffe6bcbd);

    path.moveTo(size.width * 0.07, 0);
    path.lineTo(thirthWidthScreen, 0);
    path.lineTo(thirthWidthScreen, quartHeightScreen);
    path.close();

    canvas.drawPath(path, paint);

    path = new Path();
    paint.color = Color(0xff290d3e);

    path.moveTo(thirthWidthScreen, 0);
    path.lineTo(thirthWidthScreen, quartHeightScreen);
    path.lineTo(size.width, size.height * 0.5);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);

    path = new Path();
    paint.color = Color(0xff290d3e);

    path.moveTo(0, quartHeightScreen);
    path.lineTo(size.width * 0.8, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);

    path = new Path();
    paint.color = Color(0xffdc777b);

    path.moveTo(size.width, size.height);
    path.lineTo(size.width * 0.8, size.height);
    path.lineTo(0, quartHeightScreen);
    path.lineTo(thirthWidthScreen, quartHeightScreen);
    path.lineTo(size.width, size.height * 0.5);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class _HomeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.25,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topRight: Radius.circular(80)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Spacer(flex: 2,),
            Text(
              'Mobile banking',
              style: GoogleFonts.playfairDisplay(
                fontSize: 33,
                fontWeight: FontWeight.w900,
                color: Color(0xff2a0d3d)
              ),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.only(right: 30),
              child: Text(
                'Manage your accounts, make payments, and fund transfers.',
                style: GoogleFonts.ptSans(
                  fontSize: 18,
                  color: Color(0xff2a0d3d)
                ),
              ),
            ),
            Spacer(),
            Row(
              children: <Widget>[
                Transform.rotate(
                  angle: math.pi / 4,
                  child: Container(
                    height: 9,
                    width: 9,
                    color: Color(0xff5368a1),
                  ),
                ),
                SizedBox(width: 10),
                Transform.rotate(
                  angle: math.pi / 4,
                  child: Container(
                    height: 9,
                    width: 9,
                    color: Color(0xffdae0ee),
                  ),
                ),
                SizedBox(width: 10),
                Transform.rotate(
                  angle: math.pi / 4,
                  child: Container(
                    height: 9,
                    width: 9,
                    color: Color(0xffdae0ee),
                  ),
                )
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
