import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'dart:io';
import 'dart:ui' as ui;

class FacePainter extends CustomPainter {
  final File imageFile;
  final List<Face> faces;
  double scaleX = 1.0;
  double scaleY = 1.0;
  Size? imageSize;

  FacePainter(this.imageFile, this.faces) {
    _calculateScale();
  }

  Future<void> _calculateScale() async {
    final bytes = await imageFile.readAsBytes();
    final ui.Image image = await decodeImageFromList(bytes);
    imageSize = Size(image.width.toDouble(), image.height.toDouble());
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (imageSize != null && !imageSize!.isEmpty) {
      scaleX = size.width / imageSize!.width;
      scaleY = size.height / imageSize!.height;

      final Paint paint =
          Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 3.0
            ..color = Colors.green
            ..strokeCap = StrokeCap.round
            ..strokeJoin = StrokeJoin.round;

      for (var face in faces) {
        canvas.drawRect(
          Rect.fromLTRB(
            face.boundingBox.left * scaleX,
            face.boundingBox.top * scaleY,
            face.boundingBox.right * scaleX,
            face.boundingBox.bottom * scaleY,
          ),
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant FacePainter oldDelegate) {
    return imageFile != oldDelegate.imageFile || faces != oldDelegate.faces;
  }
}
