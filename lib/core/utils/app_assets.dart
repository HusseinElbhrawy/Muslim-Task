const String imagePath = 'assets/images';
const String svgPath = 'assets/svg';
const String lottiePath = 'assets/lottie';

class AppImagesAssets {
  AppImagesAssets._internal();
  static final AppImagesAssets _instance = AppImagesAssets._internal();
  factory AppImagesAssets() => _instance;

  static const appBG = '$imagePath/bgg.png';
}

class AppSvgAssets {
  AppSvgAssets._internal();
  static final AppSvgAssets _instance = AppSvgAssets._internal();
  factory AppSvgAssets() => _instance;

  static const quran = '$svgPath/quran.svg';
}
