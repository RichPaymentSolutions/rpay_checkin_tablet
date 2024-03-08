extension GetAssetsExt on String {
  String get iconSvg {
    return 'assets/icons/$this.svg';
  }

  String get iconImg {
    return 'assets/icons/$this.png';
  }

  String get iconJPG {
    return 'assets/icons/$this.jpg';
  }

  String get iconGIF {
    return 'assets/icons/$this.gif';
  }

  String get imgPNG {
    return 'assets/images/$this.png';
  }

  String get imgJPG {
    return 'assets/images/$this.jpg';
  }
}
