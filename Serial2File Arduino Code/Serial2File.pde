int i=0;
void setup()
{
  pinMode(A0, INPUT);
 
  Serial.begin(9600);
  Serial.flush();
  Serial.print(i);
  Serial.print('.');
  Serial.print('R');
  Serial.print('\n');
}

int val;
int ans;
void loop()
{
  i++;
  Serial.print(i);
  Serial.print('.');
  val=analogRead(A0);
  ans=map(val,0,1023,0,10);
  Serial.print(val);
  Serial.print('\n');
  delay(100);
}
  
