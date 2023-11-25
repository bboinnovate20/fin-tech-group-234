import 'dart:io';
import 'dart:typed_data';
import 'package:intl/intl.dart';

import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

Future<Uint8List> createPDF() async {
  var myTheme = ThemeData.withFont(
    base: Font.ttf(await rootBundle.load("assets/open-sans.ttf")),
  );

  var pdf = Document(
    theme: myTheme,
  );

  pdf.addPage(pw.Page(
      build: (pw.Context context) => pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Customer Details
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Container(
                    margin: const pw.EdgeInsets.only(bottom: 12),
                    child: pw.Text(
                      "Customer Details",
                      style: const pw.TextStyle(
                          fontSize: 12), // Adjust the font size
                    ),
                  ),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      // Customer Details
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Container(
                            margin: const pw.EdgeInsets.only(bottom: 12),
                            child: pw.Text(
                              "Customer Details",
                              style: const pw.TextStyle(
                                  fontSize: 12), // Adjust the font size
                            ),
                          ),
                          // Replacing CustomerCard with the provided Container
                          pw.Container(
                            decoration: pw.BoxDecoration(
                              borderRadius: pw.BorderRadius.circular(10),
                              color: const PdfColor.fromInt(
                                  0xFFFFFFFF), // White color
                              boxShadow: const [
                                pw.BoxShadow(
                                  color: PdfColor.fromInt(
                                      0xFF000000), // Black color
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            child: pw.Padding(
                              padding: const pw.EdgeInsets.all(15.0),
                              child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Padding(
                                    padding:
                                        const pw.EdgeInsets.only(bottom: 5.0),
                                    child: pw.Text(
                                      "Tolu Adeboye ",
                                      style: pw.TextStyle(
                                        fontSize: 16,
                                        color: const PdfColor.fromInt(
                                            0xFF000000), // Black color
                                        fontWeight: pw.FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  pw.Text(
                                    "Tolu@gmail.com  | +2348012345678",
                                    style: const pw.TextStyle(fontSize: 12),
                                  ),
                                  pw.Text(
                                    "23 Kings street, Ikeja, Lagos ",
                                    style: const pw.TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      // ... other parts of your widget hierarchy ...
                    ],
                  ),
                ],
              ),
              // Invoice Details
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Container(
                    margin: const pw.EdgeInsets.only(bottom: 12, top: 20),
                    child: pw.Text(
                      "Invoice Details",
                      style: const pw.TextStyle(
                          fontSize: 12), // Adjust the font size
                    ),
                  ),
                  // InvoiceData(),

                  pw.Container(
                      decoration: pw.BoxDecoration(
                        borderRadius: pw.BorderRadius.circular(10),
                        border: pw.Border.all(
                          width: 1,
                          color: const PdfColor.fromInt(0xFFDCE3E7),
                        ),
                      ),
                      child: pw.ClipRect(
                          child: pw.Column(children: [
                        pw.Container(
                          decoration: const pw.BoxDecoration(
                            color: PdfColor.fromInt(0xFFF0F8FF),
                          ),
                          child: pw.Padding(
                            padding: const pw.EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 20,
                            ),
                            child: pw.Text(
                              "Invoice #1",
                              style: const pw.TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 20,
                          ),
                          child: pw.Row(
                            crossAxisAlignment: pw.CrossAxisAlignment.center,
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Padding(
                                padding: const pw.EdgeInsets.only(top: 10.0),
                                child: pw.Column(
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.Text(
                                      "Issue date",
                                      style: const pw.TextStyle(fontSize: 10),
                                    ),
                                    pw.Text(
                                      "10-10-2023",
                                      style: pw.TextStyle(
                                        fontSize: 10,
                                        fontWeight: pw.FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.end,
                                children: [
                                  pw.Text(
                                    "Due date",
                                    style: const pw.TextStyle(fontSize: 10),
                                  ),
                                  pw.Text(
                                    "10-10-2023",
                                    style: pw.TextStyle(
                                      fontSize: 10,
                                      fontWeight: pw.FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ]))),

                  pw.Container(
                    decoration: const pw.BoxDecoration(
                        color: PdfColor.fromInt(0xFFF0F8FF)),
                    child: pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12),
                      child: pw.Row(
                        children: [
                          pw.SizedBox(
                            width: 40,
                            child: pw.Text(
                              "S/N",
                              style: const pw.TextStyle(
                                  fontSize: 16,
                                  color: PdfColor.fromInt(0xFF374B58)),
                            ),
                          ),
                          pw.SizedBox(
                            width: 60,
                            child: pw.Text(
                              "Item",
                              style: const pw.TextStyle(
                                  fontSize: 16,
                                  color: PdfColor.fromInt(0xFF374B58)),
                            ),
                          ),
                          pw.SizedBox(
                            width: 50,
                            child: pw.Text(
                              "Quantity",
                              style: const pw.TextStyle(
                                  fontSize: 16,
                                  color: PdfColor.fromInt(0xFF374B58)),
                            ),
                          ),
                          pw.SizedBox(
                            width: 60,
                            child: pw.Text(
                              "Amount",
                              style: const pw.TextStyle(
                                  fontSize: 16,
                                  color: PdfColor.fromInt(0xFF374B58)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  pw.Container(
                    decoration: const pw.BoxDecoration(
                        color: PdfColor.fromInt(0xFFFFFFFF)),
                    child: pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12),
                      child: pw.Row(
                        children: [
                          pw.SizedBox(
                            width: 40,
                            child: pw.Text(
                              "1",
                              style: const pw.TextStyle(
                                  fontSize: 16,
                                  color: PdfColor.fromInt(0xFF374B58)),
                            ),
                          ),
                          pw.SizedBox(
                            width: 60,
                            child: pw.Text(
                              "Clothings",
                              style: const pw.TextStyle(
                                  fontSize: 16,
                                  color: PdfColor.fromInt(0xFF374B58)),
                            ),
                          ),
                          pw.SizedBox(
                            width: 50,
                            child: pw.Text(
                              "2",
                              style: const pw.TextStyle(
                                  fontSize: 16,
                                  color: PdfColor.fromInt(0xFF374B58)),
                            ),
                          ),
                          pw.SizedBox(
                            width: 60,
                            child: pw.Text(
                              "10,000",
                              style: const pw.TextStyle(
                                  fontSize: 16,
                                  color: PdfColor.fromInt(0xFF374B58)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  pw.Container(
                    decoration: const pw.BoxDecoration(
                      color: PdfColor.fromInt(
                          0xFFF0F8FF), // Color.fromRGBO(240, 248, 255, 1)
                    ),
                    child: pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 20),
                      child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text(
                            "Total",
                            style: TextStyle(
                                fontSize: 17,
                                color: const PdfColor.fromInt(0xFF374B58),
                                fontWeight: pw.FontWeight.bold),
                          ),
                          pw.Text(
                            "N 10,000",
                            style: pw.TextStyle(
                              color: const PdfColor.fromInt(
                                  0xFF0077FF), // Color.fromRGBO(0, 119, 255, 1)
                              fontWeight: pw.FontWeight.bold,
                              fontSize: 19,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  pw.Container(
                    margin: const pw.EdgeInsets.only(top: 20),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          "Note",
                          style: const pw.TextStyle(
                              fontSize: 12), // Adjust the font size
                        ),
                        pw.Container(
                          margin: const pw.EdgeInsets.only(top: 6, bottom: 16),
                          decoration: pw.BoxDecoration(
                            border: pw.Border.all(
                              width: 1.2,
                              color: const PdfColor.fromInt(
                                0xFFDCE3E7, // Replace with the desired color
                              ),
                            ),
                            borderRadius: pw.BorderRadius.circular(10),
                          ),
                          child: pw.Padding(
                              padding: const pw.EdgeInsets.all(10.0),
                              child: Column(children: [
                                pw.Text(
                                  "Kindly ensure the payment is completed within a 30-minute timeframe.",
                                  style: const pw.TextStyle(
                                      fontSize: 12), // Adjust the font size
                                ),
                                pw.Text(
                                  "Payment Link: www.paystack.com",
                                  style: const pw.TextStyle(
                                      fontSize: 12), // Adjust the font size
                                ),
                              ])),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )));

  return await pdf.save();
  // return await pdf.save();
}

String _formatDate(DateTime date) {
  final format = DateFormat.yMMMd('en_US');
  return format.format(date);
}

class PdfExample extends pw.StatelessWidget {
  @override
  pw.Widget build(pw.Context context) {
    return Container();
  }
}
