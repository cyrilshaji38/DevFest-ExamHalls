import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_genius_scan/flutter_genius_scan.dart';
import 'package:open_file/open_file.dart';

void scan(){
  FlutterGeniusScan.scanWithConfiguration({
    'source': 'camera',
    'multiPage': true,
  }).then((result) {
    String pdfUrl = result['pdfUrl'];
    OpenFile.open(pdfUrl.replaceAll("file://", '')).then(
            (result) => debugPrint(result.message),
        onError: (error) => displayError(error));
  }, onError: (error) => displayError(error));
}

void displayError(PlatformException error) {}