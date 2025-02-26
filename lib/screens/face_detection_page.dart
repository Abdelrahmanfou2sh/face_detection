import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../widgets/face_painter.dart';

class FaceDetectionPage extends StatefulWidget {
  const FaceDetectionPage({super.key});

  @override
  State<FaceDetectionPage> createState() => _FaceDetectionPageState();
}

class _FaceDetectionPageState extends State<FaceDetectionPage> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  final FaceDetector _faceDetector = FaceDetector(
    options: FaceDetectorOptions(
      enableLandmarks: true,
      enableClassification: true,
      enableTracking: true,
    ),
  );
  List<Face> _faces = [];
  bool _isProcessing = false;

  Future<void> _getImage(ImageSource source) async {
    setState(() {
      _isProcessing = true;
      _faces = [];
    });

    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      final File file = File(image.path);
      final inputImage = InputImage.fromFile(file);
      final List<Face> faces = await _faceDetector.processImage(inputImage);

      setState(() {
        _image = file;
        _faces = faces;
        _isProcessing = false;
      });
    } else {
      setState(() {
        _isProcessing = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('كاشف الوجوه', style: TextStyle(fontFamily: 'Arial')),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(8),
              ),
              child:
                  _isProcessing
                      ? const Center(child: CircularProgressIndicator())
                      : _image == null
                      ? const Center(
                        child: Text(
                          'اختر صورة للبدء',
                          style: TextStyle(fontSize: 18, fontFamily: 'Arial'),
                        ),
                      )
                      : Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.file(_image!, fit: BoxFit.contain),
                          CustomPaint(painter: FacePainter(_image!, _faces)),
                        ],
                      ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () => _getImage(ImageSource.camera),
                  icon: const Icon(Icons.camera_alt),
                  label: const Text(
                    'الكاميرا',
                    style: TextStyle(fontFamily: 'Arial'),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () => _getImage(ImageSource.gallery),
                  icon: const Icon(Icons.photo_library),
                  label: const Text(
                    'المعرض',
                    style: TextStyle(fontFamily: 'Arial'),
                  ),
                ),
              ],
            ),
          ),
          if (_faces.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'تم اكتشاف ${_faces.length} وجه',
                style: const TextStyle(fontSize: 16, fontFamily: 'Arial'),
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _faceDetector.close();
    super.dispose();
  }
}
