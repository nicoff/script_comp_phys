#include <stdio.h>  

// define the "change" word
cw=0;	

// go through the 21 sites stored
// in N with field values E
for(i=1; i<=21; i++){

	z=ranf();			// random number for the flip
	if(z<P(E&7)){	// fetch the value from the look up table
		cw=(cw|1);	// this value has to be flipped later
	}
	
	// circular right shift
	// to get the next site
	cw=ror(cw,3);
	E=ror(E,3);
}

cw=ror(cw,1);	// ignore the last unused bit
N=(N^cw);			// flip the spins in N

