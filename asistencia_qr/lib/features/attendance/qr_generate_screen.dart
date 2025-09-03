import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:convert';
import '../../data/isar_service.dart';
import '../../data/models/qr_registro.dart';

class QrGenerateScreen extends StatefulWidget {
  const QrGenerateScreen({super.key});

  @override
  State<QrGenerateScreen> createState() => _QrGenerateScreenState();
}

class _QrGenerateScreenState extends State<QrGenerateScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dniController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  bool _showQR = false;

  Future<void> _guardarQr(BuildContext context, String qrData, String dni) async {
    await IsarService.isar.then((isar) async {
      await isar.writeTxn(() async {
        await isar.qrRegistros.put(
          QrRegistro()
            ..docenteDni = dni
            ..qrData = qrData
            ..fechaCreacion = DateTime.now(),
        );
      });
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.blue[900],
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Icon(
                  Icons.check_circle,
                  color: Colors.white,
                  size: 18,
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  '¡QR guardado exitosamente!',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.yellow[700],
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final qrJson = jsonEncode({
      'dni': _dniController.text,
      'nombre': _nombreController.text,
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generar QR para Gafete'),
        backgroundColor: Colors.blue[800],
        foregroundColor: Colors.yellow[700],
      ),
      backgroundColor: Colors.blue[800],
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.yellow[700],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _dniController,
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Colors.blue[900]),
                          decoration: InputDecoration(
                            labelText: 'DNI',
                            labelStyle: TextStyle(color: Colors.blue[900]),
                            border: const OutlineInputBorder(),
                            prefixIcon: Icon(Icons.badge, color: Colors.blue[900]),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ingrese el DNI';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _nombreController,
                          style: TextStyle(color: Colors.blue[900]),
                          decoration: InputDecoration(
                            labelText: 'Nombre',
                            labelStyle: TextStyle(color: Colors.blue[900]),
                            border: const OutlineInputBorder(),
                            prefixIcon: Icon(Icons.person, color: Colors.blue[900]),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ingrese el nombre';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton.icon(
                          icon: const Icon(Icons.qr_code),
                          label: const Text('Generar QR'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[900],
                            foregroundColor: Colors.yellow[700],
                            minimumSize: const Size.fromHeight(48),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                _showQR = true;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  if (_showQR)
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: QrImageView(
                            data: qrJson,
                            version: QrVersions.auto,
                            size: 220.0,
                            backgroundColor: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text('DNI: ${_dniController.text}', style: const TextStyle(fontSize: 18, color: Colors.white)),
                        Text('Nombre: ${_nombreController.text}', style: const TextStyle(fontSize: 18, color: Colors.white)),
                        const SizedBox(height: 16),
                        ElevatedButton.icon(
                          icon: const Icon(Icons.save),
                          label: const Text('Guardar QR'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow[700],
                            foregroundColor: Colors.blue[900],
                            minimumSize: const Size.fromHeight(48),
                          ),
                          onPressed: () => _guardarQr(context, qrJson, _dniController.text),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
} 