import 'package:blog_app/screens/interest_screen_two.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'chipperscreen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: double.infinity,
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 1.0,
                  width: MediaQuery.of(context).size.width * 1.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("images/bg-7.jpeg"),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 1.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.black, Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 200,
                  left: 40,
                  child: Container(
                    child: Text(
                      "Publish your\npodcast\neverywhere",
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        letterSpacing: .5,
                        fontWeight: FontWeight.bold,
                      )),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 130,
                  left: 40,
                  child: Container(
                    width: 250,
                    height: 50,
                    child: RaisedButton(
                      color: Colors.redAccent,
                      child: Text(
                        "Get Started",
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold)),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (ctx) => SecondInterestScreen()));
                      },
                    ),
                  ),
                )
              ],
            )

            // Container(
            //   margin: EdgeInsets.only(bottom: 100, left: 45),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     children: [
            //       Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text(
            //             "Publish your\npodcast\neverywhere",
            //             style: GoogleFonts.lato(
            //                 textStyle: TextStyle(
            //               color: Colors.white,
            //               fontSize: 40,
            //               letterSpacing: .5,
            //               fontWeight: FontWeight.bold,
            //             )),
            //           ),
            //           SizedBox(height: 25),
            //           GestureDetector(
            //             onTap: () {
            //               Navigator.of(context).pushReplacement(MaterialPageRoute(
            //                   builder: (ctx) => ChipperScreen()));
            //             },
            //             child: Container(
            //                 alignment: Alignment.center,
            //                 color: Colors.redAccent,
            //                 width: 250,
            //                 height: 50,
            //                 child: Text(
            //                   "Get Started",
            //                   style: GoogleFonts.lato(
            //                       textStyle: TextStyle(
            //                           color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold)),
            //                 )),
            //           ),
            //         ],
            //       )
            //     ],
            //   ),
            // )),
            ));
  }
}
