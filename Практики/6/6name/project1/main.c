#include <8051.h>

void pp(unsigned char a){
ACC=a; 

SCON = 0xCC; 
TMOD = 0x20;
TH1 = 0xFF;
TL1= 0xFF;
TR1 = 0x1;
SBUF = a;
while(!TI); 
TI=0; 

}
void main()
{
unsigned int i=0,j=0;
unsigned char st1 [9]={'d','e','n','i','s','o','v','a',' '};
unsigned char st2 [9]={' ','p','o','l','i','n','a',' ',' '};


PCON = 0x80;

for(i=0;i<9;i++){
pp(st1[i]);
};
pp(2);
for(i=0;i<9;i++){
pp(st2[i]);
};
pp(2);

while(1){};
}
/*#include <8051.h>

#define BUFFER_ADDR 0x40  // ????? ?????? ? RAM

void UART_Init() {
    SCON = 0x90;   // ????? 2 (9 ???), ?????????? ?????? (REN=1)
    PCON |= 0x80;  // SMOD=1 ??? 375 ????/? ??? 12 ???
}

void main() {
    unsigned char i;
    unsigned char *buffer = (unsigned char *)BUFFER_ADDR;
    
    UART_Init();
    
    // ????? 15 ????
    for (i = 0; i < 15; i++) {
        while (!RI);      // ???????? ??????
        buffer[i] = SBUF; // ?????????? ? ??????
        RI = 0;           // ????? ?????
    }
    
    while(1);  // ??????????
}


/*#include <8051.h>

void pp(unsigned char a){
ACC=a; 

SCON = 0xCC; 
TMOD = 0x20;
TH1 = 0xFF;
TL1= 0xFF;
TR1 = 0x1;
SBUF = a;
while(!TI); 
TI=0; 

}
void main()
{
unsigned int i=0,j=0;
unsigned char st1 [9]={'g','o','r','y','a','c','h','e','v'};
unsigned char st2 [9]={'e','k','a','t','e','r','i','n','a'};


PCON = 0x80;

for(i=0;i<9;i++){
pp(st1[i]);
};
pp(2);
for(i=0;i<9;i++){
pp(st2[i]);
};
pp(2);

while(1){};
}*/