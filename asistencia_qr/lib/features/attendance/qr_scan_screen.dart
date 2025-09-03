import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'dart:convert';
import '../../data/isar_service.dart';
import '../../data/models/docente.dart';
import 'attendance_logic.dart';
import 'attendance_result_screen.dart';

class QrScanScreen extends StatefulWidget {
  const QrScanScreen({super.key});

  @override
  State<QrScanScreen> createState() => _QrScanScreenState();
}

class _QrScanScreenState extends State<QrScanScreen> {
  bool _isProcessing = false;

  Future<void> _procesarQr(BuildContext context, String qrData) async {
    if (_isProcessing) return;
    setState(() => _isProcessing = true);
    try {
      final data = jsonDecode(qrData);
      final dni = data['dni'] as String?;
      final nombre = data['nombre'] as String?;
      if (dni == null || nombre == null) {
        throw Exception('QR inválido');
      }
      final isar = await IsarService.isar;
      var docente = await isar.docentes.getByDni(dni);
      if (docente == null) {
        await isar.writeTxn(() async {
          docente = Docente()
            ..dni = dni
            ..nombre = nombre
            ..apellidos = '';
          await isar.docentes.put(docente!);
        });
      }
      final estado = await AttendanceLogic.registrarAsistencia(dni);
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => AttendanceResultScreen(
              success: true,
              docenteNombre: docente!.nombre,
              docenteDni: docente!.dni,
              estado: estado,
              fechaHora: DateTime.now(),
            ),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const AttendanceResultScreen(
              success: false,
              message: 'QR inválido',
            ),
          ),
        );
      }
    } finally {
      await Future.delayed(const Duration(seconds: 2));
      if (mounted) setState(() => _isProcessing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Escanear QR')),
      body: Stack(
        children: [
          MobileScanner(
            onDetect: (capture) {
              if (_isProcessing) return;
              final barcode = capture.barcodes.first;
              final String? code = barcode.rawValue;
              if (code != null) {
                _procesarQr(context, code);
              }
            },
          ),
          if (_isProcessing)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
} 