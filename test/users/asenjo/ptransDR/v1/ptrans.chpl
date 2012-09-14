/*
Traspose a given matrix B to matrix A
Array is "manually" distributed on locales so each locale has a DR subblock 
Rows to columns communications are implemented a la MPI: 
explicit Data[localeA].DR[slicedest]=Data[localeB].DR[sliceSource]
*/

use BlockDist;
use util;

config const n=2, m=4: int;
config const g=3, h=3;
const gridDom = {1..g, 1..h};
var gridLocales: [gridDom] locale;
setupGridLocales();

type elType = real;

record localInfo {
  const domA = {1..n, 1..m};
  const domB = {1..m, 1..n};

  var A: [domA] elType;
  var B: [domB] elType;

  proc Acompute return A[domA];
  proc Bcompute return B[domB];

  var localDelta: elType;
}

// set up the data arrays
const gridDist = gridDom dmapped Block(gridDom, gridLocales);
var Data: [gridDist] localInfo;

// make sure we got it right
forall (dat, loc) in (Data, gridLocales) {
  assert(here == dat.locale);
  assert(dat.locale == loc);
}

var errCount = 0;

proc verify() {
  forall ((gi,gj), dat) in (gridDom, Data) {
  if false {
    writeln("Error: ");
    errCount += 1;
  } // forall

  }
}

// initialize B

config const singleinit = false;
forall (dat, (gi,gj)) in (Data, gridDom) {
  if singleinit {
    dat.B[2,2] = 100;
   } else {
    forall ((i,j), a) in (dat.domB, dat.Bcompute) {
      a = i+ j*0.1;
     }
  }
}


// transpose B -> A

proc transpose() {
  var k: int;
  forall (dat, (gi,gj)) in (Data, gridDom) 
  {
     for k in 1..m do {
         dat.A[1..n,k] = Data[gj, gi].B[k, 1..n];
     } // copy B rows into A columns
  } 
}

//showfetch(true);
transpose();          
showfetch(false);

//  verify(true);

writeln("Done");

