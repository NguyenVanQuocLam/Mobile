import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MyApp());
}

final FlutterLocalNotificationsPlugin notificationsPlugin =
FlutterLocalNotificationsPlugin();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Permission Demo")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.camera_alt),
              label: const Text("Chụp ảnh"),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CameraScreen()),
              ),
            ),

            ElevatedButton.icon(
              icon: const Icon(Icons.map),
              label: const Text("Xem bản đồ"),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const MapScreen()),
              ),
            ),

            ElevatedButton.icon(
              icon: const Icon(Icons.notifications),
              label: const Text("Gửi thông báo"),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const NotificationScreen()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Màn hình chụp ảnh
class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File? imageFile;

  Future<void> _showPermissionDeniedDialog(String message) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Không thể truy cập tính năng'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              openAppSettings();
            },
            child: const Text('Mở cài đặt'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Đóng'),
          ),
        ],
      ),
    );
  }

  Future<void> _takePhoto() async {
    final status = await Permission.camera.request();
    if (status.isGranted) {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        setState(() {
          imageFile = File(pickedFile.path);
        });
      }
    } else {
      await _showPermissionDeniedDialog('Bạn đã từ chối quyền camera. Không thể truy cập tính năng này.');
    }
  }

  @override
  void initState() {
    super.initState();
    _takePhoto();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chụp ảnh")),
      body: Center(
        child: imageFile != null
            ? Image.file(imageFile!)
            : const Text("Không có ảnh nào"),
      ),
    );
  }
}

// Màn hình bản đồ
class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? currentPosition;

  Future<void> _showPermissionDeniedDialog(String message) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Không thể truy cập tính năng'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              openAppSettings();
            },
            child: const Text('Mở cài đặt'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Đóng'),
          ),
        ],
      ),
    );
  }

  Future<void> _getLocation() async {
    final status = await Permission.locationWhenInUse.request();
    if (status.isGranted) {
      Position position = await Geolocator.getCurrentPosition();
      setState(() {
        currentPosition = LatLng(position.latitude, position.longitude);
      });
    } else {
      await _showPermissionDeniedDialog('Bạn đã từ chối quyền vị trí. Không thể truy cập tính năng này.');
    }
  }

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bản đồ")),
      body: currentPosition != null
          ? GoogleMap(
        initialCameraPosition: CameraPosition(
          target: currentPosition!,
          zoom: 10,
        ),
        markers: {
          Marker(
            markerId: const MarkerId("here"),
            position: currentPosition!,
            infoWindow: const InfoWindow(title: "Vị trí của bạn"),
          )
        },
      )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}

// Màn hình gửi thông báo
class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  Future<void> _initNotificationPlugin() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const ios = DarwinInitializationSettings();
    const initSettings =
    InitializationSettings(android: android, iOS: ios);
    await notificationsPlugin.initialize(initSettings);
  }

  Future<void> _showPermissionDeniedDialog(String message) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Không thể truy cập tính năng'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              openAppSettings();
            },
            child: const Text('Mở cài đặt'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Đóng'),
          ),
        ],
      ),
    );
  }

  Future<void> _sendNotification() async {
    final status = await Permission.notification.request();
    if (status.isGranted) {
      const androidDetails = AndroidNotificationDetails(
        'channelId',
        'channelName',
        importance: Importance.max,
        priority: Priority.high,
      );
      const iosDetails = DarwinNotificationDetails();
      const notificationDetails =
      NotificationDetails(android: androidDetails, iOS: iosDetails);

      await notificationsPlugin.show(
        0,
        'Xin chào! Tôi là Lâm',
        'Hẹ hẹ hẹ!',
        notificationDetails,
      );
    } else {
      await _showPermissionDeniedDialog('Bạn đã từ chối quyền gửi thông báo. Không thể truy cập tính năng này.');
    }
  }

  @override
  void initState() {
    super.initState();
    _initNotificationPlugin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Thông báo")),
      body: Center(
        child: ElevatedButton(
          onPressed: _sendNotification,
          child: const Text("Gửi thông báo"),
        ),
      ),
    );
  }
}