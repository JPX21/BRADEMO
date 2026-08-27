void cadastrarFuncionario({required String nome, String? cargo}) {
  print("Boas-vindas, $nome!");
  if (cargo != null) {
    print("Cargo: $cargo");
  }
}

int multiplicar(int a, int b) => a * b;

void main() {
  cadastrarFuncionario(nome: "Ana", cargo: "Analista");
  print("Resultado: ${multiplicar(5, 4)}");
}