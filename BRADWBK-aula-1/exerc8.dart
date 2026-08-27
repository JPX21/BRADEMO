void main() {
  Demo d = Demo();

  // 1. Use uma cascata (..) para definir A como 50, B como 60 e chamar showVal na mesma linha
  d
    ..setA(50)
    ..setB(60)
    ..showVal();
}