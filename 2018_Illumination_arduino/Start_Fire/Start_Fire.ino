
void setup() {
  int i;
  Serial.begin(115200);
  Serial.println();
  for(i = 2; i < 13; i++){
    pinMode(i, OUTPUT);
  }
}

void loop() {
  int i;
  analogWrite(2, 1023);
  delay(2000);
  while(analogRead(A0) > 200){
    Serial.println(analogRead(A0));
    delay(1);
  }

  for( i = 3; i < 13; i++ ){
    Serial.println(analogRead(A0));
    analogWrite(i, 1023);
    delay(500);
  }
  
  delay(1000);
}
