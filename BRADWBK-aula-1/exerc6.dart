void main() {
  // 1. Declare 'apelido' como uma String que PODE ser nula
  String? apelido;

  apelido = "Dudu";

  // 2. Adicione o operador que assegura que 'apelido' não é nulo na hora de imprimir
  print(apelido!);
}