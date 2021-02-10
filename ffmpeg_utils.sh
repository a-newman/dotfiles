replace_audio() {
    wavfile=$1
    mp4file=$2
    outfile=$3
    ffmpeg -i $mp4file -i $wavfile -c:v copy -c:a aac -map 0:v:0 -map 1:a:0 $outfile
}
