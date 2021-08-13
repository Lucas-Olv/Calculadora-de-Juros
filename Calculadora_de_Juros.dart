import 'dart:io';

int main() 
{
telaInicial();
return  0;
}

//Função de boas vindas e apresentação do menu
void telaInicial() {
  var selecionarMenu = 0;
  var selecionarMenuInput = "";

  print("Seja bem vindo a calculadora de juros! v0.2.0");
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
  
  var juroSimplesInput = "";
  double montante = 0;
  double capitalInicial = 0;
  double taxaJuros = 0;
  double tempo = 0; 

  print("Calculadora de juros simples selecionada");

  stdout.write("Digite o valor inicial: ");
  juroSimplesInput = stdin.readLineSync()!;
  capitalInicial = double.parse(juroSimplesInput);

  stdout.write("Digite a taxa de juros ao ano: ");
  juroSimplesInput = stdin.readLineSync()!;
  taxaJuros = double.parse(juroSimplesInput);

  stdout.write("Digite o tempo em anos: ");
  juroSimplesInput = stdin.readLineSync()!;
  tempo= double.parse(juroSimplesInput);

  taxaJuros = taxaJuros / 100;
  montante = capitalInicial  + (capitalInicial * taxaJuros * tempo);

print("O montante será de R\$$montante reais ao fim de $tempo anos e os juros acumulados serão de R\$${montante - capitalInicial} reais.");


}

void calcJurosComposto() {
  print("Hello 2");
}
