for dir in ./*/
do
    dir=${dir%*/}
    echo "Calling gource on ${dir##*/}"
    gource --output-custom-log gource_${dir##*/}.txt ./${dir##*/}
    # Make every repo a distinct node in the final output
    sed -i -r "s#(.+)\|#\1|/${dir##*/}#" gource_${dir##*/}.txt
done

cat gource*.txt | sort -n > gource_combined.txt

gource -3840x2160 -c 4 -r 30 -max-user-speed 16 --dir-name-depth 3 --highlight-dirs -o - gource_combined.txt | ffmpeg -y -r 60 -f image2pipe -vcodec ppm -i - -vcodec libvpx -b 100000K gource.webm

