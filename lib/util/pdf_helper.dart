import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:untitled2/util/global.dart';
import 'package:printing/printing.dart';
Future<void> createPdf()
async {
  final pdf = pw.Document();

  pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Padding(
          padding: pw.EdgeInsets.all(8.0),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.SizedBox(height: 10,),
              pw.Row(
                children: [
                  pw.Text("$name",style:  pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 25,
                      color: PdfColors.black
                  ),),
                  pw.Spacer(),
                  pw.Text("DesignMNL Studio",style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 25,
                      color: PdfColors.black
                  ),),
                ],
              ),
              pw.Row(
                children: [
                  pw.Text("$address",style:  const pw.TextStyle(
                      fontSize: 25,
                      color: PdfColors.pink
                  ),),
                  pw.Spacer(),
                  pw.Text("$phone",style: const pw.TextStyle(
                      fontSize: 25,
                      color: PdfColors.black
                  ),),
                ],
              ),
               pw.SizedBox(height: 10,),
              pw.Divider(thickness: 2,),
              pw.Row(
                children: [
                  pw.Text("Bill To",style: pw.TextStyle(
                    color: PdfColors.grey,
                    fontSize: 20,
                    fontWeight: pw.FontWeight.bold,
                  ),),
                  pw.Spacer(),
                  pw.Text("Please Make Payable To:",style: pw.TextStyle(
                    color: PdfColors.grey,
                    fontSize: 20,
                    fontWeight: pw.FontWeight.bold,
                  ),),
                  pw.Spacer(),
                  pw.Text("Invoice",style: pw.TextStyle(
                    color: PdfColors.grey,
                    fontSize: 20,
                    fontWeight: pw.FontWeight.bold,
                  ),),
                ],
              ),
              pw.Row(
                children: [
                  pw.Text("LogoMNL \nStudio",style: pw.TextStyle(
                    color: PdfColors.black,
                    fontSize: 15,
                    fontWeight: pw.FontWeight.bold,
                  ),),
                  pw.Spacer(),
                  pw.Text("DesignMNL \nStudio",style: pw.TextStyle(
                    color: PdfColors.black,
                    fontSize: 15,
                    fontWeight: pw.FontWeight.bold,
                  ),),
                  pw.Spacer(),
                  pw.Text("Invoice No :001",style: pw.TextStyle(
                    color: PdfColors.blue,
                    fontSize: 15,
                    fontWeight: pw.FontWeight.bold,
                  ),),
                ],
              ),
              pw.Text("$address",style: const pw.TextStyle(
                  fontSize: 15,
                  color: PdfColors.grey
              ),),
              pw.SizedBox(height: 10,),
              pw.Container(
                height: 50,
                width: 400,
                decoration: const pw.BoxDecoration(
                    color: PdfColors.blue
                ),
                child: pw.Center(
                  child: pw.Text("INVOICE",
                    style: const pw.TextStyle(
                        color: PdfColors.white,
                        fontSize: 20
                    ),),
                ),
              ),
              pw.SizedBox(height: 10,),
              pw.Row
                (
                children: [
                  pw.Text("Quality",style: pw.TextStyle(
                    fontSize: 20,
                    color: PdfColors.grey,
                    fontWeight: pw.FontWeight.bold,
                  ),),
                  pw.Spacer(),
                  pw.Text("Product",style: pw.TextStyle(
                    fontSize: 20,
                    color: PdfColors.grey,
                    fontWeight: pw.FontWeight.bold,
                  ),),
                  pw.Spacer(),
                  pw.Text("Price",style: pw.TextStyle(
                    fontSize: 20,
                    color: PdfColors.grey,
                    fontWeight: pw.FontWeight.bold,
                  ),),
                  pw.Spacer(),
                  pw.Text("Total Price",style: pw.TextStyle(
                    fontSize: 20,
                    color: PdfColors.grey,
                    fontWeight: pw.FontWeight.bold,
                  ),),
                ],
              ),
              pw.Column(
                children: [
                  pw.Column(
                    children: List.generate(productList.length, (index) =>
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(8.0),
                          child: pw.Row(
                            children: [
                              pw.Text("${productList[index]['Quality']}",style: pw.TextStyle(
                                fontSize: 20,
                                color: PdfColors.black,
                                fontWeight: pw.FontWeight.bold,
                              ),),
                              pw.SizedBox(width: 100,),
                              pw.Text("${productList[index]['name']}",style: pw.TextStyle(
                                fontSize: 20,
                                color: PdfColors.black,
                                fontWeight: pw.FontWeight.bold,
                              ),),
                              pw.SizedBox(width: 50,),
                              pw.Text("${productList[index]['price']}",style: pw.TextStyle(
                                fontSize: 20,
                                color: PdfColors.black,
                                fontWeight: pw.FontWeight.bold,
                              ),),
                              pw.SizedBox(width: 50,),
                              pw.Text("${productList[index]['total']}",style: pw.TextStyle(
                                fontSize: 20,
                                color: PdfColors.black,
                                fontWeight: pw.FontWeight.bold,
                              ),),
                            ],
                          ),
                        ),),
                  ),
                ],
              ),
            ],
          ),
        );
      }));
  await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save());
}