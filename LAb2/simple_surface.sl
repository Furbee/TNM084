// A very simple RSL surface shader

#include "voronoi.sl"

surface simple_surface()
{
 // These should be input arguments to a proper shader
  float freq = 5.0; // This many tiles across the unit square
  color edgecolor = color(0.59,0.38,0.10); // Crease color

  float ss = s*freq; // Scale to 0..freq over unit square
  float tt = t*freq;

  float f1, f2, dx1, dy1, dx2, dy2; // Outputs for voronoi function
  voronoi_f2_2d(ss, tt, 1.0, 0.5, f1, f2, dx1, dy1, dx2, dy2);

  // Use automatic anti-aliasing: filterstep() instead of step()
  //First argument = thickness of crease
  float tile = filterstep(0.08, f2-f1); // 1 inside tiles, 0 along edges

  // Set tile color to grey
  color tilecolor = color(0.357, 0.345, 0.345);

  // Mix final color. Do not bother with any lighting model.
  Ci = mix(edgecolor, tilecolor, tile);
  Oi = Os;
}