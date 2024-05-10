class Video {
  Video(
      {required this.id,
      required this.titulo,
      required this.thumb,
      required this.canal});
/*
  Video.fromJson({required Map<String,dynamic> json, required int index}){
        id= json["items"][index]["id"]["videoId"];
        titulo= json["items"][index]["snippet"]["title"];
        thumb= json["items"][index]["snippet"]["thumbnails"]["high"]["url"];
        canal= json["items"][index]["snippet"]["channelTitle"];
  }
*/
   String id;
   String titulo;
   String thumb;
   String canal;

  static Video fromJson(Map<String,dynamic> json, int index){
    return Video(
        id: json["items"][index]["id"]["videoId"],
        titulo: json["items"][index]["snippet"]["title"],
        thumb: json["items"][index]["snippet"]["thumbnails"]["high"]["url"],
        canal: json["items"][index]["snippet"]["channelTitle"]);
  }

}
