void main() {
  // Objetos utilizando os named constructors
  Laptop laptopNavegacao = Laptop.navegacao(
    1,
    "Laptop para Navegação",
  );

  Laptop laptopEscritorio = Laptop.escritorio(
    2,
    "Laptop para Escritório",
  );

  Laptop laptopProgramacao = Laptop.programacao(
    3,
    "Laptop para Programação",
  );

  // Imprime os detalhes
  laptopNavegacao.exibirDetalhes();
  laptopEscritorio.exibirDetalhes();
  laptopProgramacao.exibirDetalhes();
}

class Laptop {
  int id;
  String nome;
  int ram;
  double clockCpu;

  // Construtor padrão
  Laptop(this.id, this.nome, this.ram, this.clockCpu);

  //para navegação na internet
  Laptop.navegacao(this.id, this.nome)
      : ram = 4,
        clockCpu = 2.0;

  //para uso em escritório
  Laptop.escritorio(this.id, this.nome)
      : ram = 8,
        clockCpu = 2.5;

  //para programação
  Laptop.programacao(this.id, this.nome)
      : ram = 16,
        clockCpu = 3.5;

  // Exibe detalhes
  void exibirDetalhes() {
    print("--- Detalhes ---");
    print("ID: $id");
    print("Modelo: $nome");
    print("Quantidade de RAM: ${ram}GB");
    print("Clock Boost: ${clockCpu}GHz");
    print("");
  }
}