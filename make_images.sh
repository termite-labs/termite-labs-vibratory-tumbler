#!/usr/bin/env sh
OPENSCAD=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD
parts_height=200
parts_width=200
instructions_width=300
instructions_height=300

# Generate STL thumbnails
for i in *.stl; do
  T=__tmp__$i
  b=`basename "$i"`
  echo import\(\"./$i\"\)\; > "$T"
  $OPENSCAD -o "assets/models/$b".png --autocenter --viewall --imgsize=$parts_width,$parts_height "$T"
  rm "$T"
done

function resize {
	rm $1/final*	
	for i in $(ls $1/*); do		
		dir=`dirname $i`
		file=`basename $i`
		out="$dir"/final.$file				
		convert $i -resize $parts_width"x"$parts_height $out
		echo "converted $i to $out"
	done		
}

resize "assets/parts" $parts_width $parts_height
resize "assets/instructions" $instructions_width $instructions_height