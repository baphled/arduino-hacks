// Franzis Arduino
// melody

int Speaker=8;
int length=15;
char notes[]="ccggaagffeeddc ";
int beats[]={ 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 2, 4 };
int tempo=300;

void setup()
{
  pinMode(Speaker, OUTPUT);
}

void loop()
{
  for(int i=0; i<length; i++)
  {
    if(notes[i]==' ')
    {
      delay(beats[i] * tempo);
    }
    else
    {
      playNote(notes[i], beats[i] * tempo);
    }

    delay(tempo / 2);
  }
}

void playTone(int ton, int duration)
{
  for(long i=0; i<duration * 1000L; i += ton * 2)
  {
    digitalWrite(Speaker, HIGH);
    delayMicroseconds(ton);
    digitalWrite(Speaker, LOW);
    delayMicroseconds(ton);
  }
}

void playNote(char note, int duration)
{
  char names[]={'c', 'd', 'e', 'f', 'g', 'a', 'b', 'C'};
  int tones[]={1915, 1700, 1519, 1432, 1275, 1136, 1014, 956};
  int x;

  for(x=0; x<8; x++)
  {
    if(names[x]==note) {
      playTone(tones[x], duration);
    }
  }

}
