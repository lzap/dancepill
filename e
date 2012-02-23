#!/bin/bash

e() { 
	for EXTRACT_FILE in $*; do
		if [ -f "$EXTRACT_FILE" ] ; then 
			FT1=$(file -bi "$EXTRACT_FILE" | grep -Eo '[[:alnum:]_-]+/[[:alnum:]_-]+')
			case $FT1 in 
				"application/x-bzip2") tar xvjf "$EXTRACT_FILE" || bunzip2 "$EXTRACT_FILE" ;; 
				"application/x-gzip") tar xvzf "$EXTRACT_FILE" || gunzip "$EXTRACT_FILE" ;; 
				"application/x-rar") unrar x "$EXTRACT_FILE" || rar x "$EXTRACT_FILE" ;; 
				"application/x-arj") arj x "$EXTRACT_FILE" || 7za x "$EXTRACT_FILE" ;; 
				"application/x-lha") lha x "$EXTRACT_FILE" || 7za x "$EXTRACT_FILE" ;; 
				"application/x-cpio") cpio -i "$EXTRACT_FILE" ;; 
				"application/x-tar") tar xvf "$EXTRACT_FILE" || gunzip "$EXTRACT_FILE" ;; 
				"application/x-zip") unzip "$EXTRACT_FILE" ;; 
				"application/zip") unzip "$EXTRACT_FILE" ;; 
				"application/x-7z-compressed") 7za x "$EXTRACT_FILE" ;; 
				"application/x-7za-compressed") 7za x "$EXTRACT_FILE" ;; 
				"application/octet-stream") unlzma "$EXTRACT_FILE" || 7za x "$EXTRACT_FILE" || uncompress "$EXTRACT_FILE" ;; 
				*) echo "'$EXTRACT_FILE' ($FT1) cannot be extracted via e() bash function" ;; 
			esac 
		else 
			echo "'$EXTRACT_FILE' is not a valid file" 
		fi 
	done
}
