
int LED=13;
int LDR=0;
int Pot=1;
int cnt=0;
int value,threshold=0;

void setup()
{
  Serial.begin(9600);
  Serial.println("Starting Sensor\n");
  pinMode(LED,OUTPUT);
  value=analogRead(LDR);
}

void loop()
{
  cnt++;
  if(cnt>1000)
  {
    cnt=0;
    value=analogRead(LDR);
  }

  threshold=(analogRead(Pot)/10);
  if(value>(analogRead(LDR)+threshold)||value<(analogRead(LDR)-threshold))
  {
    Serial.println("Sensor Triggered\n");
    digitalWrite(LED,HIGH);
    delay(2500);
    digitalWrite(LED,LOW);
    value=analogRead(LDR);
  }

  delay(10);
}
