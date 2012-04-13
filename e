#!/bin/bash
# :vim sw=2:ts=2:et

e() { 
  for F in $*; do
    if [ -f "$F" ] ; then 
      FT1=$(file -bi "$F" | grep -Eo '[[:alnum:]_-]+/[[:alnum:]_-]+')
      DIR="$F-e"
      mkdir "$DIR" || exit 1
      pushd "$DIR"
      case $FT1 in 
        "application/x-bzip2") tar xvjf "../$F" || bunzip2 "../$F" ;; 
        "application/x-gzip") tar xvzf "../$F" || gunzip "../$F" ;; 
        "application/x-xz") tar xvJf "../$F" ;; 
        "application/x-rar") unrar x "../$F" || rar x "../$F" ;; 
        "application/x-arj") arj x "../$F" || 7za x "../$F" ;; 
        "application/x-lha") lha x "../$F" || 7za x "../$F" ;; 
        "application/x-cpio") cpio -i "../$F" ;; 
        "application/x-tar") tar xvf "../$F" || gunzip "../$F" ;; 
        "application/x-zip") unzip "../$F" ;; 
        "application/zip") unzip "../$F" ;; 
        "application/x-7z-compressed") 7za x "../$F" ;; 
        "application/x-7za-compressed") 7za x "../$F" ;; 
        "application/octet-stream") unlzma "../$F" || 7za x "../$F" || uncompress "../$F" ;; 
        *) echo "'../$F' ($FT1) cannot be extracted via e() bash function" ;; 
      esac 
      popd
      # expecting only one file
      if [ "$(ls "$DIR" | wc -l)" == "1" ]; then
        mv -v "$DIR/*" . && rmdir "$DIR"
      fi
    else 
      echo "'$F' is not a valid file" 
    fi 
  done
}
