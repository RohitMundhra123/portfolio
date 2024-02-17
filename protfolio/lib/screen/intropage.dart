import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:protfolio/widgets/animatedtext.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _scaleanimation;
  bool showContent = false;
  bool showTitleContent = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _scaleanimation = Tween<double>(
      begin: 3.0,
      end: 1.0,
    ).animate(_controller);

    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          showContent = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 10),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Tween<Offset>(
                          begin: Offset(
                              MediaQuery.of(context).size.width / 2 - 100,
                              MediaQuery.of(context).size.height / 2 - 100),
                          end: const Offset(0, 0),
                        ).animate(_controller).value,
                        child: Transform.scale(
                            scale: _scaleanimation.value,
                            child: Opacity(
                                opacity: _animation.value, child: child)),
                      );
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      child: const CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 50,
                        backgroundImage: AssetImage(
                          'assets/images/photo.jpg',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  if (showContent == true)
                    Expanded(
                      child: Column(
                        children: [
                          AnimatedTextKit(
                            totalRepeatCount: 1,
                            animatedTexts: [primaryTypeWriter("Rohit Mundhra")],
                            onFinished: () {
                              setState(() {
                                showTitleContent = true;
                              });
                            },
                          ),
                          if (showTitleContent == true)
                            AnimatedTextKit(
                              repeatForever: true,
                              pause: const Duration(seconds: 2),
                              animatedTexts: [
                                secondaryTypeWriter("Flutter Developer"),
                                secondaryTypeWriter("Tech Enthusiast"),
                                secondaryTypeWriter("CSE Student"),
                              ],
                            ),
                        ],
                      ),
                    )
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



  
                // Row(
                //   mainAxisSize: MainAxisSize.max,
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     expandedButton("Download CV", () => null),
                //     const SizedBox(width: 50),
                //     expandedButton("Connect", () => null)
                //   ],
                // ),