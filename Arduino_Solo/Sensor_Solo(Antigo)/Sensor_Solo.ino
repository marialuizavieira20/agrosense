const int ValorAr = 550;
const int ValorAgua = 230;

int valorUmidadeSolo = 0;
float porcentagemUmidade = 0;

int maximo = 75;
int minimo = 65;

const int Limite = 75;

void setup(){
  Serial.begin(9600);
}

void loop() {
  valorUmidadeSolo = analogRead(A1);

  int faixa = ValorAr - ValorAgua;

  int distancia = ValorAr - valorUmidadeSolo;

  porcentagemUmidade = (float)distancia / faixa * 100.0;

  if (porcentagemUmidade < 0) porcentagemUmidade = 0;
  if (porcentagemUmidade > 100) porcentagemUmidade = 100;
/*
  Serial.print("Leitura bruta: ");
  Serial.print(valorUmidadeSolo);
  Serial.print(" | Umidade: ");
  Serial.print(porcentagemUmidade);
  Serial.println("%");

  Serial.print(valorUmidadeSolo);
*/
  Serial.print(maximo);
  Serial.print(minimo);
  Serial.println(porcentagemUmidade);
  
  

  delay(1000);
}