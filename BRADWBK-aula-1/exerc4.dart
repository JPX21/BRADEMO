void main() {
  Map notas = {"Marcio": 9.5, "Carla": 8.5, "Tereza": 10.0};

  // 1. Altere a nota da Carla para 9.5
  notas["Carla"] = 9.5;

  // 2. Remova "Marcio" do mapa de notas
  notas.remove("Marcio");

  print(notas); // {Carla: 9.5, Tereza: 10.0}
}