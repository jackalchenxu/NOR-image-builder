#!/bin/bash
#please format your nor description like below format:
# starting_addr1 file_name1 
# starting_addr2 file_name2
# we will fill the gap with 0xFF

#function to make exact size of paddedFile.bin contains of '0xFF'
pad() {
	dd if=/dev/zero ibs=$1 count=1 | tr "\000" "\377" > paddedFile.bin
}

if [ -z $1 ]; then
	echo "need nor_desc file as parameter!"
	exit;
fi

#final output file is 'a.bin'
output_file="a.bin"
rm -f $output_file && touch $output_file

while read line; do
	addr=$(echo $line | awk '{print $1}' )
	file=$(echo $line | awk '{print $2}' )	
	file_size=$(stat -c%s $outpuf_file)
	pad_size=$((addr - file_size))
	if [ "$pad_size" -lt "0" ]; then
		echo "starting addr:$addr error"
		exit
	elif [ "$pad_size" -gt "0" ]; then
		pad $pad_size
		cat paddedFile.bin >> $output_file
	fi
	cat $file >> $output_file
done < $1
