import 'dart:io';

class House {
  int id;
  String nome;
  double preco;

  House(this.id, this.nome, this.preco);
}

void main() {
  List<House> houseList = [];

  for (int i = 1; i <= 3; i++) {
    print('\n--- Cadastro da Casa $i ---');

    stdout.write('Digite o ID: ');
    int id = int.parse(stdin.readLineSync()!);

    stdout.write('Digite o Nome/Descrição: ');
    String nome = stdin.readLineSync()!;

    stdout.write('Digite o Preço: ');
    double preco = double.parse(stdin.readLineSync()!);

    House newHouse = House(id, nome, preco);
    houseList.add(newHouse);
  }

  for (int i = 0; i < houseList.length; i++) {
    houseList[i].nome = '${houseList[i].nome} (Cadastrada)';
  }

  print('\n=== CASAS CADASTRADAS NO PORTAL ===');

  for (var house in houseList) {
    print(
      'ID: ${house.id} | '
      'Nome: ${house.nome} | '
      'Preço: R\$ ${house.preco.toStringAsFixed(2)}',
    );
  }
}