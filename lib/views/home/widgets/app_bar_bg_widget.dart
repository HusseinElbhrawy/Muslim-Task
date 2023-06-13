import 'package:flutter/material.dart';

import '../../../core/utils/app_assets.dart';

class AppBarBGWidget extends StatelessWidget {
  const AppBarBGWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Image.asset(
        AppImagesAssets.appBG,
        fit: BoxFit.cover,
      ),
    );
  }
}
