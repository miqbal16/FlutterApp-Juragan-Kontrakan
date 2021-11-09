class City {
  int id;
  String name;
  String assetImage;
  City(this.id, this.name, this.assetImage);
}

Map cities = {
  'pekanbaru': City(1, 'Pekanbaru', 'assets/images/pekanbaru.jpeg'),
  'bogor': City(2, 'Bogor', 'assets/images/bogor.jpeg'),
  'yogyakarta': City(3, 'Yogyakarta', 'assets/images/yogyakarta.jpeg'),
  'jakarta': City(4, 'Jakarta', 'assets/images/jakarta.jpg'),
  'bandung': City(5, 'Bandung', 'assets/images/bandung.jpg'),
  'surabaya': City(6, 'Surabaya', 'assets/images/surabaya.jpg'),
  'palembang': City(7, 'Palembang', 'assets/images/palembang.jpg'),
};
