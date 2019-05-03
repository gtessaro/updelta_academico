class Aviso{

  final String image;
  final String title;
  final String body;

  Aviso({this.image,this.title,this.body});

  factory Aviso.fromJson(Map<String, dynamic> json){
    return Aviso(
      image: json["image"],
      title: json["title"],
      body: json["body"]
    );
  }

}