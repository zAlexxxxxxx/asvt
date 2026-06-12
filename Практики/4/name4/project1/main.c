#include <8051.h>
void msec (int x) 
{ 
int i;
for(i=0; i<40*x; i++){
 TH0 = 0;
 TL0 = 0;
 TR0 = 1;
 while (TH0<195);
 TR0 = 0;
 TF0 = 0; 
}
}
void main() 
{
int i;
const unsigned char array[5];
const unsigned char queue[5];
TMOD=0x1; 
array[0]=0b00000110; 
array[1] = 0b01100000; 
array[2]= 0b00000001;
array[3] = 0b00011000;
array[4] = 0b10000000;

queue[0]= 10; 
queue[1] = 10; 
queue[2]= 30;
queue[3] = 50;
queue[4]= 70;

for(i=0;i<5;i++) 
{
P1=array[i];
msec(queue[i]*50000); 
}
P1 = 0;
while(1);
}