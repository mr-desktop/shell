file="keyframe"
mkdir -p export
for i in {1..4}; do
    convert "${file}${i}.png" -crop 1x800 -set filename:tile "%[fx:page.x/5+10]" "export/${file}_%[filename:tile]_${i}.png"
done

convert +append export/${file}*.png carrousel.png

# for file in `find export -type f | awk 'NR % 2 == 0'`; do echo $file done