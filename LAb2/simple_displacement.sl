// A very simple RSL displacement shader

#include "voronoi.sl"

displacement simple_displacement() {

float freq = 5.0; // This many bircks across the unit square
  //color edgecolor = color(0.59,0.38,0.10); // Crease color

  float ss = s*freq; // Scale to 0..freq over unit square
  float tt = t*freq;

  float f1, f2, dx1, dy1, dx2, dy2; // Outputs for voronoi function
  voronoi_f2_2d(ss, tt, 1.0, 0.3, f1, f2, dx1, dy1, dx2, dy2);

  //First argument = thickness of crease
  float tile = filterstep(0.06, f2-f1); // 1 inside bricks, 0 along crease

  
  P = P - N * 0.08 * tile;
  N = calculatenormal(P);  
}