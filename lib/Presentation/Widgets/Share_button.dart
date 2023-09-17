import 'dart:async';
import 'package:flutter/material.dart';
import 'package:esys_flutter_share_plus/esys_flutter_share_plus.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'dart:typed_data';

import '../../constants/colors.dart';

class ShareButton extends StatelessWidget {
  final String textToShare;

  const ShareButton(this.textToShare, {Key? key});

  Future<void> shareTextAsImage() async {
    double verticalPadding = 130;
    double horizontalPadding = 50;

    int maxLines = 20; // Adjust as needed

    // Create a text painter with maxLines property
    final textPainter = TextPainter(
      text: TextSpan(
        text: textToShare,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontFamily: 'Cairo',
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
      maxLines: maxLines,
    );

    textPainter.layout(maxWidth: 800 - (2 * horizontalPadding));

    double imageWidth = textPainter.width + (2 * horizontalPadding);
    double imageHeight = textPainter.height + (3 * verticalPadding);

    // Create a picture recorder
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(
      recorder,
      Rect.fromPoints(Offset.zero, Offset(imageWidth, imageHeight)),
    );

    final backgroundPaint = Paint()..color = Colors.white;
    canvas.drawRect(
      Rect.fromPoints(Offset.zero, Offset(imageWidth, imageHeight)),
      backgroundPaint,
    );

    // Load and draw the top image
    final topImage = await loadImage('assets/splash.png');
    if (topImage != null) {
      const topImageWidth = 800.0;
      const topImageHeight = 800.0;

      final topImageRect = Rect.fromCenter(
        center: Offset(
          imageWidth / 2,
          topImageHeight / 2, // Adjust vertical position
        ),
        width: topImageWidth,
        height: topImageHeight,
      );

      canvas.drawImageRect(
          topImage,
          Rect.fromLTRB(
              0, 0, topImage.width.toDouble(), topImage.height.toDouble()),
          topImageRect,
          Paint());
    }

    textPainter.paint(canvas, Offset(horizontalPadding, verticalPadding));

    final bottomImage = await loadImage(
      'assets/nav2.png',
    ); // Replace with your bottom image path
    if (bottomImage != null) {
      final aspectRatio = bottomImage.width / bottomImage.height;
      const bottomImageWidth = 300.0; // Adjust as needed
      final bottomImageHeight = bottomImageWidth / aspectRatio;

      final bottomImageRect = Rect.fromCenter(
        center: Offset(
          imageWidth / 2,
          verticalPadding +
              textPainter.height +
              (verticalPadding / 2) +
              bottomImageHeight / 0.8,
        ),
        width: bottomImageWidth,
        height: bottomImageHeight,
      );

      // Draw the bottom image at the end of the text
      canvas.drawImageRect(
          bottomImage,
          Rect.fromLTRB(0, 0, bottomImage.width.toDouble(),
              bottomImage.height.toDouble()),
          bottomImageRect,
          Paint());
    }

    // Save the final image
    final img = await recorder.endRecording().toImage(
          imageWidth.toInt(),
          imageHeight.toInt(),
        );
    final byteData = await img.toByteData(format: ui.ImageByteFormat.png);
    final buffer = byteData!.buffer.asUint8List();

    await Share.file(
      'شارك النص كصورة',
      'share.png',
      Uint8List.fromList(buffer),
      'image/png',
    );
  }

  Future<ui.Image?> loadImage(String imagePath) async {
    final image = await rootBundle.load(imagePath);
    final bytes = Uint8List.sublistView(image.buffer.asUint8List());
    final codec = await ui.instantiateImageCodec(bytes);
    final frameInfo = await codec.getNextFrame();
    return frameInfo.image;
  }

  void shareText() {
    String textWithCustomEnding =
        '$textToShare\n تمت المشاركة من خلال تطبيق تَفَكُّر';

    Share.text('شارك النص', textWithCustomEnding, 'text/plain');
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(left: 0, bottom: 10),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.share,
              color: isDarkMode ? Colors.white : AppColors.primaryColor,
            ),
            onPressed: shareText,
          ),
          IconButton(
            icon: Icon(
              Icons.image,
              color: isDarkMode ? Colors.white : AppColors.primaryColor,
            ),
            onPressed: shareTextAsImage,
          ),
        ],
      ),
    );
  }
}
