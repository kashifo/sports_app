import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sports_app/models/OnboardingProvider.dart';
import 'package:sports_app/utils/size_config.dart';

class OnboardingScreen2 extends StatefulWidget {
  const OnboardingScreen2({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen2> createState() => _OnboardingScreen2State();
}

class _OnboardingScreen2State extends State<OnboardingScreen2> {
  late PageController _controller;
  int _currentPage = 0;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  AnimatedContainer _buildDots({
    int? index,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
        color: _currentPage == index ? Colors.deepPurple : Colors.black,
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: _currentPage == index ? 20 : 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;

    return ChangeNotifierProvider(
      create: (context) => OnboardingProvider(),
      child: Consumer<OnboardingProvider>(
          builder: (context, provider, child) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: PageView.builder(
                      physics: const BouncingScrollPhysics(),
                      controller: _controller,
                      onPageChanged: (value) => setState(() => _currentPage = value),
                      itemCount: provider.pages.length,
                      itemBuilder: (context, index) {
                        final page = provider.pages[index];
                        return Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.deepPurpleAccent.withOpacity(0.1),
                                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 120, left: 40, right: 40, bottom: 40),
                                child: Image.asset(
                                  page.imageAsset,
                                  // Remove fixed height here, let it be flexible
                                ),
                              ),
                            ),
                            SizedBox(
                              height: (height >= 840) ? 40 : 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                page.title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: "Mulish",
                                  fontWeight: FontWeight.w600,
                                  fontSize: (width <= 550) ? 22 : 35,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                page.description,
                                style: TextStyle(
                                  fontFamily: "Mulish",
                                  fontWeight: FontWeight.w300,
                                  fontSize: (width <= 550) ? 14 : 25,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            provider.pages.length,
                                (int index) => _buildDots(
                              index: index,
                            ),
                          ),
                        ),
                        _currentPage + 1 == provider.pages.length
                            ? Padding(
                          padding: const EdgeInsets.all(30),
                          child: ElevatedButton(
                            onPressed: () {
                              _controller.jumpToPage(0);
                            },
                            child: const Text("START", style: TextStyle(color: Colors.white),),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              padding: (width <= 550)
                                  ? const EdgeInsets.symmetric(
                                  horizontal: 100, vertical: 20)
                                  : EdgeInsets.symmetric(
                                  horizontal: width * 0.2, vertical: 25),
                            ),
                          ),
                        )
                            : Padding(
                          padding: const EdgeInsets.all(30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  _controller.jumpToPage(2);
                                },
                                child: const Text(
                                  "SKIP",
                                  style: TextStyle(color: Colors.black),
                                ),
                                style: TextButton.styleFrom(
                                  elevation: 0,
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: (width <= 550) ? 13 : 17,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  _controller.nextPage(
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.easeIn,
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.deepPurple,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  elevation: 0,
                                  padding: (width <= 550)
                                      ? const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 20)
                                      : const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 25),
                                ),
                                child: const Text("NEXT", style: TextStyle(color: Colors.white),),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}