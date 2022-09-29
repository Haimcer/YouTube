import 'dart:convert';

class Video {
  String? id;
  String? titulo;
  String? descricao;
  String? imagem;
  String? canal;
  Video({
    this.id,
    this.titulo,
    this.descricao,
    this.imagem,
    this.canal,
  });
  /*
  static converterJson(Map<String, dynamic> json) {
    return Video(
        id: json["id"]["videoId"],
        titulo: json["snippet"]["title"],
        imagem: json["snippet"]["thumbnails"]["high"]["url"],
        canal: json["snippet"]["channelId"]);
  }*/

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
        id: json["id"]["videoId"],
        titulo: json["snippet"]["title"],
        imagem: json["snippet"]["thumbnails"]["high"]["url"],
        canal: json["snippet"]["channelTitle"],
        descricao: json["snippet"]["description"]);
  }

  /* Video copyWith({
    String? id,
    String? titulo,
    String? descricao,
    String? imagem,
    String? canal,
  }) {
    return Video(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      descricao: descricao ?? this.descricao,
      imagem: imagem ?? this.imagem,
      canal: canal ?? this.canal,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'titulo': titulo,
      'descricao': descricao,
      'imagem': imagem,
      'canal': canal,
    };
  }

  factory Video.fromMap(Map<String, dynamic> map) {
    return Video(
      id: map['id'] != null ? map['id'] as String : null,
      titulo: map['titulo'] != null ? map['titulo'] as String : null,
      descricao: map['descricao'] != null ? map['descricao'] as String : null,
      imagem: map['imagem'] != null ? map['imagem'] as String : null,
      canal: map['canal'] != null ? map['canal'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Video.fromJson(String source) =>
      Video.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Video(id: $id, titulo: $titulo, descricao: $descricao, imagem: $imagem, canal: $canal)';
  }

  @override
  bool operator ==(covariant Video other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.titulo == titulo &&
        other.descricao == descricao &&
        other.imagem == imagem &&
        other.canal == canal;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        titulo.hashCode ^
        descricao.hashCode ^
        imagem.hashCode ^
        canal.hashCode;
  }
}
*/
}
