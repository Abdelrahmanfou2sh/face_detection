# كاشف الوجوه - Face Detection App

## الوصف - Description

تطبيق فلاتر لكشف الوجوه باستخدام Google ML Kit. يمكن للتطبيق التقاط الصور من الكاميرا أو اختيارها من المعرض وتحديد الوجوه فيها تلقائياً.

A Flutter application for face detection using Google ML Kit. The app can capture images from camera or select them from gallery and automatically detect faces in them.

## المميزات - Features

- واجهة مستخدم بسيطة وسهلة الاستخدام
- التقاط الصور من الكاميرا
- اختيار الصور من معرض الصور
- كشف الوجوه تلقائياً في الصور
- عرض عدد الوجوه المكتشفة
- تحديد الوجوه بإطار أخضر

- Simple and user-friendly interface
- Capture images from camera
- Select images from gallery
- Automatic face detection in images
- Display number of detected faces
- Highlight faces with green bounding box

## المتطلبات التقنية - Technical Requirements

- Flutter SDK
- Dart SDK
- Android Studio / VS Code
- Google ML Kit Face Detection
- Image Picker
- Permission Handler

## التثبيت - Installation

1. قم بتنزيل أو استنساخ المشروع
   Clone or download the project

```bash
git clone [repository-url]
cd face_detect
```

2. قم بتثبيت التبعيات
   Install dependencies

```bash
flutter pub get
```

3. قم بتشغيل التطبيق
   Run the app

```bash
flutter run
```

## كيفية الاستخدام - How to Use

1. افتح التطبيق
   Open the app

2. اختر أحد الخيارات:
   Choose one of the options:
   - الكاميرا (Camera): لالتقاط صورة جديدة
   - المعرض (Gallery): لاختيار صورة موجودة

3. انتظر حتى يتم معالجة الصورة
   Wait for the image to be processed

4. سيتم عرض الصورة مع تحديد الوجوه المكتشفة
   The image will be displayed with detected faces highlighted

## الرخصة - License

MIT License

## المساهمة - Contributing

المساهمات مرحب بها! يرجى فتح issue أو pull request.
Contributions are welcome! Please open an issue or pull request.
