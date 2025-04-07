// Define uma variavel que representa a porta que o arduino está conectado. 'int' pois é o valor é inteiro e não ira mudar enquanto o código estiver em vigor.
const int PINO_SENSOR_LDR = A1;

// Declara uma variável e que ela ira armazenar os dados coletados pelo arduino.
int valorLuminosidade;

// Cria uma função, ela declara a velocidade da comunicação com o computador.
void setup() {
  // velocidade 9600 bps
  Serial.begin(9600);
}

// Função que define o que irá ficar se repetindo (o que estiver dentro dela irá se repetir).
void loop() {
  // Função criada para ler os valores que estão na porta setada da variável em "()".
  valorLuminosidade = analogRead(PINO_SENSOR_LDR);
  // Coloca o texto no monitor serial.
  Serial.print("Luminosidade: ");
  // pula linha após inserir o valor.
  Serial.println(valorLuminosidade);
  // Define o intervalo de tempo que virá uma nova informação do arduino ao meu computador.
  // pausando o programa por 2000 milissegundos (2seg).
  delay(2000);
}