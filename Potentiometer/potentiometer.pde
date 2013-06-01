// Reading a potentiometer

int Pot=-1;
int raw, raw_last, raw_min, raw_max = 0;
int hysteresis=10;

void setup() {
  Serial.begin(9600);
  Serial.println("reading a potentiometer professionally\n");
  Serial.println();
}

void loop() {
  raw=analogRead(Pot);
  raw_min=raw_last-hysteresis;
  raw_max=raw_last+hysteresis;

  if ((raw!=raw_last)) {
    if ((raw>raw_max) || (raw<raw_min)) {
      Serial.println(raw);
      raw_last=raw;
    }
  }
}

