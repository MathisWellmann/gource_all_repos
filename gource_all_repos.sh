for dir in ./*/     # list directories in the form "/tmp/dirname/"
do
    dir=${dir%*/}      # remove the trailing "/"
    echo "Calling gource on ${dir##*/}"    # print everything after the final "/"
    gource --output-custom-log gource_${dir##*/}.txt ./${dir##*/}
    sed -i -r "s#(.+)\|#\1|/${dir##*/}#" gource_${dir##*/}.txt
done

cat gource*.txt | sort -n > gource_combined.txt

gource -1920x1080 -c 4 --max-user-speed 16 --dir-name-depth 3 --highlight-dirs -o - gource_combined.txt | ffmpeg -y -r 60 -f image2pipe -vcodec ppm -i - -vcodec libvpx -b 30000K gource.webm

