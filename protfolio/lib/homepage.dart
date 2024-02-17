import 'package:flutter/material.dart';
import 'package:protfolio/screen/intropage.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late PageController _pageController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPageIndex);
    _pageController.addListener(_pageListener);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _pageListener() {
    setState(() {
      _currentPageIndex = _pageController.page!.round();
    });
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: const Color(0xFF132121),
      elevation: 5,
      shape: const Border(bottom: BorderSide(color: Colors.white, width: 0.2)),
      title: const Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(width: 10),
          Text(
            'Rohit Mundhra',
            style: TextStyle(
              fontSize: 22,
              color: Color(0xFF95A1AC),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu_open,
            color: Color(0xFF95A1AC),
            size: 36,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: const Color(0xFF132121),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: PageView(
                  controller: _pageController,
                  scrollDirection: Axis.vertical,
                  children: const [
                    IntroPage(),
                    Page2(),
                    Page2(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        'https://picsum.photos/seed/633/600',
        width: 300,
        height: 200,
        fit: BoxFit.cover,
      ),
    );
  }
}
