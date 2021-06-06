import 'package:flutter/cupertino.dart';

class BackgroundContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.topLeft,
          end: FractionalOffset.bottomRight,
          colors: [
            const Color(0xff2980B9).withOpacity(0.6),
            const Color(0xff6DD5FA).withOpacity(0.6),
          ],
          stops: const [
            0.0,
            1.0,
          ],
        ),
      ),
    );
  }

}