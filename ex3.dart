void main() {
  // Objetos da classe
  Laptop laptop1 = Laptop(1, "Acer Nitro 5", 16, 4.5);
  Laptop laptop2 = Laptop(2, "Intel Celeron N4500", 8, 2.8);
  Laptop laptop3 = Laptop(3, "Galaxy Book 2", 8, 3.1);

  // Imprime detalhes
  laptop1.exibirDetalhes();
  laptop2.exibirDetalhes();
  laptop3.exibirDetalhes();
}

class Laptop {
  int id;
  String nome;
  int ram;
  double clockCpu;

  // Construtor
  Laptop(this.id, this.nome, this.ram, this.clockCpu);

  // Exibe detalhes
  void exibirDetalhes() {
    print("--- Detalhes ---");
    print("ID: $id");
    print("Modelo: $nome");
    print("Quantidade de RAM: ${ram}GB");
    print("Clock Boost: ${clockCpu}GHz");
  }
}