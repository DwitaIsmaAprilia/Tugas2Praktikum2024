import '/ui/tampil_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FormData extends StatefulWidget {
  const FormData({Key? key}) : super(key: key);

  @override
  FormDataState createState() => FormDataState();
}

class FormDataState extends State<FormData> {
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _tahunController = TextEditingController();
  final _shiftController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hallo, Silahkan Isi Data ya!"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            _textboxNama(),
            const SizedBox(height: 20),
            _textboxNIM(),
            const SizedBox(height: 20),
            _textboxTahun(),
            const SizedBox(height: 20),
            _textboxShift(),
            const SizedBox(height: 30),
            _tombolSimpan()
          ],
        ),
      ),
    );
  }

  _textboxNama() {
    return TextField(
      decoration: InputDecoration(
        labelText: "Nama",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        prefixIcon: const Icon(Icons.person, color: Colors.blue),
        filled: true,
        fillColor: Colors.blue.shade50,
      ),
      controller: _namaController,
    );
  }

  _textboxNIM() {
    return TextField(
      decoration: InputDecoration(
        labelText: "NIM",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        prefixIcon: const Icon(Icons.badge, color: Colors.blue),
        filled: true,
        fillColor: Colors.blue.shade50,
      ),
      controller: _nimController,
    );
  }

  _textboxTahun() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Tahun Lahir",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        prefixIcon: const Icon(Icons.calendar_today, color: Colors.blue),
        filled: true,
        fillColor: Colors.blue.shade50,
      ),
      controller: _tahunController,
    );
  }

  _textboxShift() {
    return TextField(
      decoration: InputDecoration(
        labelText: "Shift Baru",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        prefixIcon: const Icon(Icons.schedule, color: Colors.blue),
        filled: true,
        fillColor: Colors.blue.shade50,
      ),
      controller: _shiftController,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
      ),
      onPressed: () {
        String nama = _namaController.text;
        String nim = _nimController.text;
        int tahun = int.parse(_tahunController.text);
        String shift = _shiftController.text;
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                TampilData(nama: nama, nim: nim, tahun: tahun, shift: shift)));
      },
      child: const Text(
        'Simpan',
        style: TextStyle(
          fontSize: 20, // Ukuran teks lebih besar
          fontWeight: FontWeight.bold, // Teks tebal (bold)
          color: Colors.black, // Warna teks putih agar kontras
          letterSpacing: 2, // Spasi antar huruf untuk kejelasan
        ),
      ),
    );
  }
}
