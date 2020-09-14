import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:mobile_bank/widgets/background_forms_widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          _Header(),
          _YourCards(),
          _Transactions()
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.36,
      child: Stack(
        children: <Widget>[
          _Background()
        ],
      ),
    );
  }
}

class _Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              painter: _BackgroundPainter(),
            ),
          ),
          Positioned(
            top: size.height * 0.19,
            left: - size.width * 0.37,
            child: Container(
              width: size.width * 0.8,
              height: size.width * 0.8,
              decoration: BoxDecoration(
                color: Color(0xff5368a1),
                borderRadius: BorderRadius.all(Radius.circular(200))
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.1,
            right: size.width * 0.268,
            child: SquareForm(
              height: size.width * 0.14,
              width: size.width * 0.14,
              circlePadding: 15,
              circleColor: Colors.white,
              squareColor: Color(0xff5368a1),
            )
          ),
          SafeArea(child: _AvatarAndMenuIcon()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  child: _SearchBar()
                ),
                SizedBox(height: 38,)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();
    Path path = new Path();

    paint.style = PaintingStyle.fill;
    paint.color = Color(0xffe3a5a8);

    final quartHeightScreen = size.height * 0.67;
    final thirthWidthScreen = size.width * 0.66;

    path.moveTo(size.width * 0.1, 0);
    path.lineTo(thirthWidthScreen, quartHeightScreen);
    path.lineTo(0, quartHeightScreen);
    path.lineTo(0, 0);
    path.close();

    canvas.drawPath(path, paint);

    path = new Path();
    paint.color = Color(0xffe6bcbd);

    path.moveTo(size.width * 0.1, 0);
    path.lineTo(thirthWidthScreen, 0);
    path.lineTo(thirthWidthScreen, quartHeightScreen);
    path.close();

    canvas.drawPath(path, paint);

    path = new Path();
    paint.color = Color(0xff290d3e);

    path.moveTo(thirthWidthScreen, 0);
    path.lineTo(thirthWidthScreen, quartHeightScreen);
    path.lineTo(size.width * 0.8, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);

    path = new Path();
    paint.color = Color(0xffdc777b);

    path.moveTo(0, quartHeightScreen);
    path.lineTo(0, size.height);
    path.lineTo(size.width * 0.8, size.height);
    path.lineTo(thirthWidthScreen, quartHeightScreen);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}

class _AvatarAndMenuIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 25,
            backgroundImage: NetworkImage('https://laverdadnoticias.com/__export/1583680359106/sites/laverdad/img/2020/03/08/sophia_lillis_inspira_a_netflix.jpg_423682103.jpg'),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert, size: 35, color: Colors.white),
          )
        ],
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15))
      ),
      child: Row(
        children: <Widget>[
          SizedBox(width: 20),
          Icon(Icons.search, size: 30,),
          SizedBox(width: 20),
          Text(
            'Search something...',
            style: GoogleFonts.ptSans(
              fontSize: 18,
              color: Colors.grey
            ),
          )
        ],
      ),
    );
  }
}

class _YourCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Your cards',
            style: GoogleFonts.playfairDisplay(
              fontSize: 25,
              color: Color(0xff2a0d3d),
              fontWeight: FontWeight.w900
            ),
          ),
          SizedBox(height: 25),
          _Card(
            amount: '\$ 9 104',
            cardType: 'Visa',
            bankCardColor: Color(0xff5368a1),
            bankCardContent: '****9652',
          ),
          SizedBox(height: 30),
          _Card(
            amount: '\$ 7 067',
            cardType: 'MasterCard',
            bankCardColor: Color(0xffdc777b),
            bankCardContent: '****1471',
          )
        ],
      ),
    );
  }
}

class _Card extends StatelessWidget {

  final Color bankCardColor;
  final String bankCardContent;
  final String amount;
  final String cardType;

  const _Card({
    @ required this.bankCardColor,
    @ required this.bankCardContent,
    @ required this.amount,
    @ required this.cardType
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.11,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: <BoxShadow> [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 40,
            spreadRadius: 4,
          )
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: <Widget>[
            _BankCard(
              color: this.bankCardColor,
              content: this.bankCardContent,
            ),
            SizedBox(
              width: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 21),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    this.amount,
                    style: GoogleFonts.quicksand(
                      color: Color(0xff2a0d3d),
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    this.cardType,
                    style: GoogleFonts.quicksand(
                      fontSize: 18,
                      color: Colors.grey
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: Container(),),
            Icon(Icons.keyboard_arrow_right, size: 35,)
          ],
        ),
      ),
    );
  }
}

class _BankCard extends StatelessWidget {
  final Color color;
  final String content;

  const _BankCard({@required this.color, @required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 100,
      height: 55,
      decoration: BoxDecoration(
        color: this.color,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Text(
        this.content,
        style: GoogleFonts.ptSans(
          color: Colors.white,
          fontSize: 15
        ),
      ),
    );
  }
}

class _Transactions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              'Recent Transactions',
              style: GoogleFonts.playfairDisplay(
                color: Color(0xff2a0d3d),
                fontSize: 24,
                fontWeight: FontWeight.w900
              ),
            ),
            _Transaction(
              icon: FontAwesomeIcons.apple,
              title: 'Apple device',
              subtitle: 'Apr 13, 7:34 AM',
              amount: '-812.50',
            ),
            _Transaction(
              icon: FontAwesomeIcons.invision,
              title: 'Invision',
              subtitle: 'Apr 12, 2:57 AM',
              amount: '-68.03',
            )
          ],
        ),
      ),
    );
  }
}

class _Transaction extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String amount;

  const _Transaction({
    this.icon,
    this.title,
    this.subtitle,
    this.amount
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: Color(0xff5368a1),
            borderRadius: BorderRadius.circular(12)
          ),
          child: FaIcon(this.icon, color: Colors.white, size: 20),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              this.title,
              style: GoogleFonts.quicksand(
                color: Color(0xff2a0d3d),
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              this.subtitle,
              style: GoogleFonts.quicksand(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
          ],
        ),
        Expanded(
          child: SizedBox(),
        ),
        Text(
          this.amount,
          style: GoogleFonts.quicksand(
            color: Color(0xff2a0d3d),
            fontSize: 21,
            fontWeight: FontWeight.bold
          ),
        ),
      ],
    );
  }
}
