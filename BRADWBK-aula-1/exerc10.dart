void main() {
  String texto = "IFSP_123";

  try {
    // Tentativa de conversão inválida
    int numero = int.parse(texto);
    print("Sucesso: $numero");
  } on FormatException catch (fe) {
    // 1. Trate a exceção de formato específica
    print("Erro de formato detectado: $fe");
  } finally {
    // 2. Defina o bloco que sempre executa no final
    print("Processamento terminado!");
  }
}