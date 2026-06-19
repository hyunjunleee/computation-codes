
const int n = 10; //led 수
const double w = 15; //각속도
const double e = 7/13; //이심률
const double i = 1/e; //이심률 역수
const double k = (double)n * (i*i - 1)/2 ; //크기 600/49
//const double s = k / (i + 1);
int led[n]; //켜지는 led 결정

void setup() {
  Serial.begin(115200);
  int i;
  for(i = 2 ;i < n+2; i++){
    pinMode(i, OUTPUT);
    led[i] = 0;
  }
}

void ellipse(double a){
  int r = floor( k / (i + cos(a)) - 2 );
//  Serial.println(r);
  led[r] = 1023;
}

void loop() {
  int i;
  double a = millis() * w / 1000 ; //아두이노의 각도
  ellipse(a);
  ellipse(a+2.0944);
  ellipse(a+4.1888);
  for(i = 0; i < n; i++ )
    analogWrite(i + 2, led[i]);
  delay(100);
  for(i = 0; i< n; i++ ){
    analogWrite(i + 2, 0);
    led[i] = 0;
  }
}



