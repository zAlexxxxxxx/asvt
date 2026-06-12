#include <8051.h>

void main()
{
	unsigned char i,j,c=0,k,drebezg=0;
	
	unsigned char *str = "00";
	unsigned char row[5] = {0xFE, 0xFD, 0xFB, 0xF7};
	unsigned char col[5] = {0x1E, 0x1D, 0x1B, 0x17};
	unsigned char *num[25] = {"0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"};
	while(1)
	{
		
		for(i=0;i<4;i++)
		{
			P3=col[i];
			for(j=0;j<4;j++)
			{
				if(P1 == row[j])
				{
					//if (c==0){
					//P0 = 0x04;
					//P0 = 0x06;
					//c = 1;
					//}
				
					P0 = 0x38;
					P2 = 0x1;
					P2 = 0x0;
					P0 = 0x6;
					//P2 = 0x1;
					P2 = 0x0;
					str = num[i+j*4];
					for(i=0;i<1;i++)
					{
						for(k=0;k<10;k++)
						{
							drebezg++;
							if (drebezg > 8)
							{
								P0 = str[i];
								P2 = 0x3;
								P2 = 0x2;
								//P2= 0x6;
								drebezg=0;
							}
						}
					}
				}
			}
		}
	}
}
