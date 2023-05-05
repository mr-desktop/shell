alias tm='cd ~/projects/teamup_all'

alias tms='clear && tm'
alias tmb='clear && tm'

alias tmu='clear && tm && teamup-up-force'
alias tmd='clear && tm && teamup-down'

function orgPhotosByDateTaken {
  exiftool "-DateTimeOriginal>FileName" -d 'I_%Y%m%d_%H%M%S.jpg' -w %f.%e *.* --ext sh
}

function secuence2Video {
  ffmpeg -framerate 30 -i %04d.png -c:v libx264 -profile:v high -crf 20 -pix_fmt yuv420p secuence.mp4
}

function pdf2Jpg {
  convert -density 300 *.pdf -quality 90 pdfjpg-coverted.jpg
}

function pdf2Png {
  convert -density 300 *.pdf -quality 90 pdfjpg-coverted.png
}

function clearPermissions {
  sudo chmod a+rw -R ./
}

function cleanSystemFiles {
  files=(".DS_Store" ".AppleDouble" ".LSOverride" ".DocumentRevisions-V100" ".fseventsd" ".Spotlight-V100" ".TemporaryItems" ".Trashes" ".VolumeIcon.icns" ".com.apple.timemachine.donotpresent" ".AppleDB" ".AppleDesktop" "Thumbs.db" "ehthumbs.db" "ehthumbs_vista.db" "desktop.ini")

for f in ${files[@]}; do
  rm -r -f -v **/${f}
done
}