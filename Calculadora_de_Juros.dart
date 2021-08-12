import 'dart:io';

int main() 
{
telaInicial();
return  0;
}

void telaInicial() {
  var selecionarMenu = 0;
  var selecionarMenuInput = "";

  print("Seja bem vindo a calculadora de juros! v0.1.0");
  print("1. Calcular juros simples.");
  print("2. Calcular juros compostos.");

  do {
    stdout.write("Por favor digite a opção desejada: ");
    selecionarMenuInput = stdin.readLineSync()!;

    if((selecionarMenuInput == "1") || (selecionarMenuInput == "2")) {
      selecionarMenu = int.parse(selecionarMenuInput);

      switch (selecionarMenu) {
        case 1:
        calcJurosSimples();
        break;

        case 2:
        calcJurosComposto();
        break;
      }
      break;
    }else {
      print("Opção inválida, tente novamente.");
    }
  } while (true);
}

void calcJurosSimples() {
  print("Hello");
}

void calcJurosComposto() {
  print("Hello 2");
}