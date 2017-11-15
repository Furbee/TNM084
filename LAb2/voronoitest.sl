#include "voronoi.sl"

surface voronoitest() {
 point Ptex = transform("object", P);
 float freq = 3.0;
 float jitter = 0.7;
 float f1, f2;
 point pt1, pt2;
 voronoi_f2_3d(Ptex, freq, jitter, f1, f2, pt1, pt2);
 float f = f2-f1;
 Ci = color(f,f,f);
 Oi = Os;
}
