#include <8051.h>
void write (char w){
P22 = 0; // RW
P21 = 1; //RS
P0 = w; //Data

P20 = 1;
P20 = 0;
}

void  display (char w){
P22 = 0; // RW
P21 = 0; //RS
P0 = w; //Data

P20 = 1;
P20 = 0;
}

void main()
{ 
	int n = 0;
	 int i = 0;
	int j = 0;
	 int buf = 0;
	unsigned char *str="Hello!";
	unsigned char *str2="2nd line";
	display(0xC0);
	n = 8;
	for(i = 0; i<6; i++){
 write(str [i]);
 write (' ');
}
display (0x04);
while (1) {
    if (j < n) {                  // ????? ? ??????
      display (0x94);  // ? ????? ?????? ??????
      for (i = 0; i <= j; i++)
        write (str2[j - i]);
    }
    else if (j <= 19) {                // ????? ? ????????
      display (0x94 - j + n - 1);
      write (' ');
      for (i = 0; i < n; i++)
        write (str2[n - i - 1]);
    }
    else if (j - 20 < n) {                      // ????? ? ?????
      buf = j - 20;        // buf = 0, 1, 2.. n-1
      display (0x80 + n - buf - 1);
      write (' ');
      for (i = 0; i < n - buf - 1; i++)
        write (str2[n - i - 1]);
    }
    else
      j = -1;
    
    j++;
  }


}

