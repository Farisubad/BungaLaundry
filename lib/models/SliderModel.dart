import 'package:flutter/material.dart';

class SliderModel {
  String imagePath;
  String title;
  String text;

  SliderModel(this.imagePath, this.title, this.text);

  static List<SliderModel> getSlides() {
    List<SliderModel> slides = new List<SliderModel>();
    SliderModel s1 = new SliderModel("assets/formal.png", "Bunga Laundry", "Pilih jenis Laundry Sesuai Pakaian Anda");
    SliderModel s2 = new SliderModel("assets/clean.png", "Bunga Laundry", " Hubungi Kami Untuk Mengantar - Jemput Pakaian Anda ");
    SliderModel s3 = new SliderModel("assets/washer.png", "Bunga Laundry", "Selamat Datang  Di Bunga Laundry");
    SliderModel s4 = new SliderModel("assets/washer.png", "Bunga Laundry", "Klik Lanjutkan Untuk Menggunakan Aplikasi");
    slides.add(s3);
    slides.add(s2);
    slides.add(s1);
    slides.add(s4);
    return slides;
  }
}
