#include <math.h>
#include <stdio.h>

double fc_f1(double a) {
	//if(a ==0) return 0;
	double r=0;
	r =tan(a);
	r=pow(r,-1);
	r=r+sin(a);
	r=r/sin(a);
	return r;
}



