#!/usr/bin/env sh
OPENSCAD=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD
parts_height=300
parts_width=300
instructions_width=350
instructions_height=350
demo_height=400
demo_width=400

# Generate STL thumbnails
for i in *.stl; do
  T=__tmp__$i
  b=`basename "$i"`
  echo import\(\"./$i\"\)\; > "$T"
  $OPENSCAD -o "assets/models/$b".png --autocenter --viewall --imgsize=$parts_width,$parts_height "$T"
  rm "$T"
done

function make_thumbs {	
    rm -r $1/thumbs/*
	for i in $(ls $1/* | grep jpeg); do		
		dir=`dirname $i`
		file=`basename $i`
		out="$dir"/thumbs/$file				
		convert $i -resize $parts_width"x"$parts_height $out
		echo "converted $i to $out"
	done		
}

resize "assets" $parts_width $parts_height