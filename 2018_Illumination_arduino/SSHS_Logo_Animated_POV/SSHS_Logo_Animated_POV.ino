
const int n = 10; //led 수
const double w = 100; //아두이노 기판 각속도
const double v = 10; //planet 각속도
const double h = 0.05; //planet 각변위
const double e = 7/13; //이심률
const double i = 1/e; //이심률 역수
const double k = (double)n * (i*i - 1)/2 ; //크기 600/49
int led[n]; //켜지는 led 결정

void setup() {
  int i;
  for(i =0 ;i<n; i++){
    pinMode(i, OUTPUT);
    led[i] = LOW;
  }
}

void ellipse(double a){
  int r = k / (i + cos(a)) - 2;
  led[r] = HIGH;
}

void loop() {
  int i;
  double a = millis() * w / 1000 ; //아두이노의 각도
  double b = a * v / w; // planet의 각도
  if(fmod(b, 6.2832) -h < fmod(a, 6.2832) < fmod(b, 6.2832) +h){
    ellipse(b);
  }
  ellipse(a);
  ellipse(a+2.0944);
  ellipse(a+4.1888);
  for(i = 0; i < n; i++ )
    digitalWrite(i, led[i]);
  delay(10);
  for(i = 0; i< n; i++ ){
    digitalWrite(i, LOW);
    led[i] = LOW;
  }
}

