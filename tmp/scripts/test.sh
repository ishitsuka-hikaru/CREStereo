#!/bin/bash
model_path=../crestereo_eth3d.mge
left=img/test/left.png
rigth=img/test/right.png
input_sizes=(1024x1536 512x768 256x384)
num_iter=10
output=tmp/data/exp230120
mkdir -p "$output"


for size in "${input_sizes[@]}"
do
    for i in $(seq 0 $((num_iter-1)))
    do
	python3 test.py \
		--model_path "$model_path" \
		--left "$left" \
		--right "$right" \
		--size "$size" \
		--output "$output"/"$size"_$(printf "%03d" "$i").png
    done
done

	
