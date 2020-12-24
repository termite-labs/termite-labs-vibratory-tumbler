#!/usr/bin/env sh
OPENSCAD=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD
thumb_size=300

# Rename all files to underscores
for file in assets/*.jpeg; do 
	mv "$file" `echo $file | tr ' ' '_' | tr '[:upper:]' '[:lower:]'` 
done

for file in assets/*.mov; do 
	mv "$file" `echo $file | tr ' ' '_' | tr '[:upper:]' '[:lower:]'` 
done

# Regenerate all thumbs
rm -r assets/thumbs/*.jpeg
for image in assets/*.jpeg; do
	filename="$(basename $image)"
	out="assets/thumbs/$filename"
	convert $image -resize $thumb_size"x"$thumb_size $out
	echo "converted $image to $out"
done	