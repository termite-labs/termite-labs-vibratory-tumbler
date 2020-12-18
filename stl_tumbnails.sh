#!/usr/bin/env sh
OPENSCAD=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD
height=128
width=128

for i in *.stl; do
  T=__tmp__$i
  b=`basename "$i"`
  echo import\(\"./$i\"\)\; > "$T"
  $OPENSCAD -o "assets/$b".png --imgsize=$width,$height "$T"
  rm "$T"
done