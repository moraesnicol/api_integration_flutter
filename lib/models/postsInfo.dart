// To parse this JSON data, do
//
//     final postsGet = postsGetFromJson(jsonString);

import 'dart:convert';

PostsGet postsGetFromJson(String str) => PostsGet.fromJson(json.decode(str));

String postsGetToJson(PostsGet data) => json.encode(data.toJson());

class PostsGet {
    PostsGet({
        this.result,
    });

    List<Result> result;

    factory PostsGet.fromJson(Map<String, dynamic> json) => PostsGet(
        result: List<Result>.from(json["Result"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Result": List<dynamic>.from(result.map((x) => x.toJson())),
    };
}

class Result {
    Result({
        this.id,
        this.codigo,
        this.respostas,
        this.dataHora,
        this.estaLido,
        this.autorId,
        this.autorNome,
        this.autorImageUrl,
        this.texto,
        this.versao,
    });

    String id;
    String codigo;
    int respostas;
    String dataHora;
    bool estaLido;
    String autorId;
    String autorNome;
    String autorImageUrl;
    String texto;
    int versao;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["ID"],
        codigo: json["Codigo"],
        respostas: json["Respostas"],
        dataHora: json["DataHora"],
        estaLido: json["EstaLido"],
        autorId: json["AutorID"],
        autorNome: json["AutorNome"],
        autorImageUrl: json["AutorImageUrl"],
        texto: json["Texto"],
        versao: json["Versao"],
    );

    Map<String, dynamic> toJson() => {
        "ID": id,
        "Codigo": codigo,
        "Respostas": respostas,
        "DataHora": dataHora,
        "EstaLido": estaLido,
        "AutorID": autorId,
        "AutorNome": autorNome,
        "AutorImageUrl": autorImageUrl,
        "Texto": texto,
        "Versao": versao,
    };
}
