import 'package:camera/camera.dart';

class BarcodeScannerStatus {
  /*
  classe que verifica se:
   - a camera está disponível
   - existe algum erro
   - armazenar o codigo de barras
   */

  final bool isCameraAvailable;
  final String error;
  final String barcode;
  final bool stopScanner;

  BarcodeScannerStatus({
    this.isCameraAvailable = false,
    this.error= "",
    this.stopScanner = false,
    this.barcode="",
  });

  factory BarcodeScannerStatus.available() =>
      BarcodeScannerStatus(isCameraAvailable: true, stopScanner: false);

  factory BarcodeScannerStatus.error(String message) =>
    BarcodeScannerStatus(error: message, stopScanner: true);

  factory BarcodeScannerStatus.barcode(String barcode)
  => BarcodeScannerStatus(barcode: barcode, stopScanner: true);


  bool get showCamera => isCameraAvailable && error.isEmpty;

  bool get hasError => error.isNotEmpty;

  bool get hasBarcode => barcode.isNotEmpty;

  BarcodeScannerStatus copyWith({
    bool? isCameraAvailable,
    String? error,
    String? barcode,
    bool? stopScanner,
    CameraController? cameraController,
  }) {
    return BarcodeScannerStatus(
      isCameraAvailable: isCameraAvailable ?? this.isCameraAvailable,
      error: error ?? this.error,
      barcode: barcode ?? this.barcode,
      stopScanner: stopScanner ?? this.stopScanner,
    );
  }
}
