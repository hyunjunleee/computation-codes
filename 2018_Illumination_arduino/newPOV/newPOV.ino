byte i;
boolean led[11];

void setup() {
  for( i = 2; i < 13; i++ ){
    pinMode(i, OUTPUT);
    led[i] = 0;
  }
  led[10] = 1;
}

void ellipse(double a){
  while(a > 19) a -= 21;
  while(a < -1 ) a += 21;
  int r = floor( abs( a - 9 ) );
  led[r] = 1;
}

void loop() {
  double a = millis() / 4;
  ellipse(a);
  ellipse(a + 7);
  ellipse(a + 14);
  for(i = 0; i < 11; i++ ){
    analogWrite( i + 2 , 1023 * led[10 - i]);
  }
//  delay(10);
  for(i = 0; i < 10; i++ ){
    led[i] = 0;
    analogWrite( i + 2 , 0 );
  }
}
