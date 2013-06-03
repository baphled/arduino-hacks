// Franzis Arduino
// twilight switch

int LED=13;
int LDR=0;
int Pot=1;
int cnt=0;

void setup()
{
  pinMode(LED,OUTPUT);
}

void loop()
{
  if(analogRead(LDR)>analogRead(Pot))cnt=0;
  if(analogRead(LDR)<analogRead(Pot))cnt++;

  if(cnt>300)
  {
    digitalWrite(LED,HIGH);
    do
    {
      delay(5000);
    }while(analogRead(LDR)<analogRead(Pot));

    cnt=0;
    digitalWrite(LED,LOW);
  }

  delay(10);

}

