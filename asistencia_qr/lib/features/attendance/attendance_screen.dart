import 'package:flutter/material.dart';
import 'qr_scan_screen.dart';
import 'qr_generate_screen.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Asistencia Docente QR')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final qr = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const QrScanScreen()),
                );
                if (qr != null) {
                  // Procesa el QR escaneado
                  print('QR escaneado: $qr');
                }
              },
              child: const Text('Escanear QR'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const QrGenerateScreen()),
                );
              },
              child: const Text('Generar mi QR'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // TODO: Mostrar estado de asistencia
              },
              child: const Text('Ver mi asistencia'),
            ),
          ],
        ),
      ),
    );
  }
} 