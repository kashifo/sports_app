import 'package:flutter/material.dart';
import 'OnboardingModel.dart';

class OnboardingProvider extends ChangeNotifier {
  int _currentPage = 0;
  int get currentPage => _currentPage;

  final List<OnboardingModel> _pages = [
    OnboardingModel(
      imageAsset: 'assets/images/o1.png',
      title: 'Targeted triumphs',
      description: 'Find your game-changer with precision ads that pave your path to victory',
    ),
    OnboardingModel(
      imageAsset: 'assets/images/o2.png',
      title: 'Track Score',
      description: 'Play, record and relive the moments that make your game extrodinary!',
    ),
    OnboardingModel(
      imageAsset: 'assets/images/o3.png',
      title: 'Game Insight',
      description: 'Experience football like never before with insights that elevate your game',
    ),
    // Add more pages here...
  ];

  List<OnboardingModel> get pages => _pages;
}