/*mex_get_dF.c
 *
 *usage dF=mex_get_df(Z) where Z is 1x3 or 3X1 array of bingham concentration
 *parameters
 *
 *warning there is no check on legitimate vales for Z, bad input will
 *case segmentation fault 
 
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "bingham.h"
#include "bingham/util.h"
#include "mex.h"
#include "bingham/bingham_constants_matlab.h"

void mexFunction(int nlhs, mxArray *plhs[], int nrhs,const mxArray *prhs[])
{
	if (nrhs != 1){
		mexErrMsgTxt("Error 1 inputs expected");
	}

      int i;
      int n=4;
	double Z[3];
      double dF[3];
	double *input1, *output;
	bingham_t B;

      double V[3][4];
    
	V[0][0]=1.0;
	V[0][1]=0.0;
	V[0][2]=0.0;
	V[0][3]=0.0;
	V[1][0]=0.0;
	V[1][1]=1.0;
	V[1][2]=0.0;
	V[1][3]=0.0;
	V[2][0]=0.0;
	V[2][1]=0.0;
	V[2][2]=1.0;
	V[2][3]=0.0;

      double *Vp[3] = {&V[0][0], &V[1][0], &V[2][0]};

      input1=mxGetPr(prhs[0]);
	for (i=0;i<3;i++){
		Z[i]=input1[i];
	}

      bingham_new(&B, n, Vp, Z);
      double *ZZ = B.Z;
      dF[0]= bingham_dF1_3d(ZZ[0], ZZ[1], ZZ[2]);
      dF[1] = bingham_dF2_3d(ZZ[0], ZZ[1], ZZ[2]);
      dF[2] = bingham_dF3_3d(ZZ[0], ZZ[1], ZZ[2]);
   

      
	plhs[0] = mxCreateDoubleMatrix(3,1, mxREAL);
		output = mxGetPr(plhs[0]);
				
		for (i=0;i<3;i++){
				output[i]=dF[i];
		}




	
}
