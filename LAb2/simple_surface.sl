// A very simple RSL surface shader

#include "voronoi.sl"

surface simple_surface()
{
  float freq = 5.0; // This many bricks across the unit square
  //color creasecolor = color(0.59,0.38,0.10); // Crease color
  //color creasecolor = color(0.652,0.600,0.360); // darker Crease color
  color creasecolor = color(0.357, 0.345, 0.345); //Dark gray

  float ss = s*freq; // Scale to 0..freq over unit square
  float tt = t*freq;

  float f1, f2, dx1, dy1, dx2, dy2; // Outputs for voronoi function
  voronoi_f2_2d(ss, tt, 1.0, 0.3, f1, f2, dx1, dy1, dx2, dy2);

  // Use automatic anti-aliasing: filterstep() instead of step()
  //First argument = thickness of crease
  float tile = filterstep(0.06, f2-f1); // 1 inside tiles, 0 along crease

  // Set tile color to grey
  //color tilecolor = color(0.357, 0.345, 0.345);
  //color tilecolor = color(0.709, 0.702, 0.695); //Lighter gray
  float wf1, wf2, wdx1, wdy1, wdx2, wdy2; // Outputs for voronoi function used by the wear on the tiles.
  voronoi_f2_2d(s*25, t*30, 7.5, 4, wf1, wf2, wdx1, wdy1, wdx2, wdy2);
  
  color tilecolor = color(0.709, 0.702, 0.695) + 0.02 * float cellnoise( dx1*89 ) 
												+ 0.12 * float cellnoise (wdx2*120);
  
  
  // Mix final color. Do not bother with any lighting model.
  Ci = mix(creasecolor, tilecolor, tile);
  Oi = Os;
}