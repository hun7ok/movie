class Movie_model {
  
  String judulfilm;
  String fotofilm;
  String jadwal;


  Movie_model({this.judulfilm,this.fotofilm,this.jadwal});

  factory Movie_model.fromJson(Map<String, dynamic> json) {
    return Movie_model(
      
      judulfilm: json["judul_film"] as String,
      fotofilm: json["foto_film"] as String,
      jadwal: json["jadwal"] as String

    );
  }

}