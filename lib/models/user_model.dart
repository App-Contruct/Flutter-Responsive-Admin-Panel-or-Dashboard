import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  int? id;
  String? idUsuario;
  List<Map<String, dynamic>>? companies;
  List<dynamic>? listCompany;
  String? nome;
  String? email;
  String? senha;
  String? image;
  dynamic imageFile;
  String? sobrenome;
  String? token;
  String? telefone;
  String? endereco;
  int? status;
  int? isCompany;
  int? roleID;
  Timestamp? createdAt;
  Timestamp? updatedAt;

  UserModel(
      {this.id,
      this.idUsuario,
      this.companies,
      this.listCompany,
      this.nome,
      this.email,
      this.senha,
      this.image,
      this.imageFile,
      this.sobrenome,
      this.token,
      this.telefone,
      this.endereco,
      this.status,
      this.isCompany,
      this.roleID,
      this.createdAt,
      this.updatedAt});

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    final List<dynamic> list = doc['companies'];
    final List<Map<String, dynamic>> map = list.cast<Map<String, dynamic>>();

    return UserModel(
      idUsuario: doc.id,
      companies: map,
      nome: doc['nome'],
      sobrenome: doc['sobrenome'],
      email: doc['email'],
      image: doc['image'],
      status: doc['status'],
      roleID: doc['roleID'],
      isCompany: doc['isCompany'],
      endereco: doc['endereco'],
      createdAt: doc['createdAt'],
    );

  }
  Map<String, dynamic> toMap(UserModel userDTO) {
    final data = {
      'companies' : userDTO.companies,
      'nome': userDTO.nome,
      'sobrenome': userDTO.sobrenome,
      'email': userDTO.email,
      'image': userDTO.image,
      'status': userDTO.status,
      'roleID' : userDTO.roleID,
      'endereco' : userDTO.endereco,
      'isCompany': userDTO.isCompany,
      'createdAt': userDTO.createdAt
    };
    return data;
  }

  @override
  String toString() {
    return 'UserModel{id: $id, idUsuario: $idUsuario, companies: $companies,'
        ' listCompany: $listCompany, nome: $nome, email: $email, senha: $senha,'
        ' image: $image, imageFile: $imageFile, sobrenome: $sobrenome, token: $token,'
        ' telefone: $telefone, endereco: $endereco, status: $status,'
        'isCompany: $isCompany, roleID: $roleID, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}
