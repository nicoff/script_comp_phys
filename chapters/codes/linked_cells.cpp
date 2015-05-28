// Program to go through all particles in cell i=2

[...]

index_particle = FIRST[i];
// the index of the first 
// particle in the ith cell

N=0;
// counter


if (index_particle!=0){
	N=1;
	// there's at least 1 particle

	j = First[i];
	while(j!=0){

		printf("particle nr %d \n",LIST[j]);
		j = LIST[j];
		// go through the particle 
		// in the ith cell

		N++;
	}
}

printf("Total nr of particles in cell %d: %d \n",i,N);

[...]

