import 'dart:io';

void main(){
  //chamada com 2 param
  cadastrarFunc(nome: "ivaneide", cargo: "Analista de Qualidade");

  //chamada com param obrigatorio
  cadastrarFunc(nome: "cleiton");
}

void cadastrarFunc({required String nome, String? cargo}){
  print("cadastro funcionario");

  if (cargo != null){
    print("bem vindo, $nome!, Seu cargo é: $cargo.");
  }else{
    print("bem vindo, $nome!");
  }

  print("cadastro feito");
}