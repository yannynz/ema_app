import 'dart:async';
import 'dart:convert';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late GoogleMapController _mapController;
  bool _mapReady = false;
  final List<LatLng> _mockCoords = [];
  int _currentIdx = 0;
  Marker? _currentMarker;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _loadMockCoords();
  }

  Future<void> _loadMockCoords() async {
    try {
      final data = await rootBundle.loadString('assets/json/location_stream.json');
      final decoded = jsonDecode(data);
      final list = decoded is List ? decoded : [decoded];
      _mockCoords.addAll(list.map((e) {
        final lat = (e['lat'] as num).toDouble();
        final lng = (e['lng'] as num).toDouble();
        return LatLng(lat, lng);
      }));
      // se o mapa já estiver pronto, inicia streaming
      if (_mapReady && _mockCoords.isNotEmpty) {
        _startStreaming();
      }
    } catch (e) {
      debugPrint('Erro ao carregar coordenadas mock: \$e');
    }
  }

  void _startStreaming() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (_currentIdx >= _mockCoords.length) return;
      final pos = _mockCoords[_currentIdx++];
      setState(() {
        _currentMarker = Marker(
          markerId: const MarkerId('stream'),
          position: pos,
        );
        _mapController.animateCamera(CameraUpdate.newLatLng(pos));
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // se plataforma não suportada, exibe placeholder
    if (!Platform.isAndroid && !Platform.isIOS) {
      return Scaffold(
        appBar: AppBar(title: const Text('Localização')),
        body: const Center(
          child: Text('Mapa não suportado nesta plataforma'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Localização')),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(-23.5913, -46.6357),
          zoom: 17,
        ),
        onMapCreated: (controller) {
          _mapController = controller;
          _mapReady = true;
          if (_mockCoords.isNotEmpty) {
            _startStreaming();
          }
        },
        markers: _currentMarker != null ? {_currentMarker!} : {},
      ),
    );
  }
}


