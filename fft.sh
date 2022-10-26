function fft() {

	if [ $# -eq 0 ]
  	then
		echo '    ___            ___'
		echo '   /   \          /   \'
		echo '   \_   \        /  __/'
		echo '    _\   \      /  /__'
		echo '    \___  \____/   __/'
		echo '        \_       _/'
		echo '          | @ @  \_'
		echo '          |'
		echo '        _/     /\'
		echo '       /o)  (o/\ \_'
		echo '       \_____/ /'
		echo '         \____/'
		echo '#########################'
		echo "  Joel's Handy FFT Tool  "
		echo '#########################'
		echo '- No user input!'
		echo '- Call "-help" for more options'
		echo ' '
	elif [ "$1" == "-help" ]
	then
		echo '    ___            ___'
		echo '   /   \          /   \'
		echo '   \_   \        /  __/'
		echo '    _\   \      /  /__'
		echo '    \___  \____/   __/'
		echo '        \_       _/'
		echo '          | @ @  \_'
		echo '          |'
		echo '        _/     /\'
		echo '       /o)  (o/\ \_'
		echo '       \_____/ /'
		echo '         \____/'
		echo '#########################'
		echo "  Joel's Handy FFT Tool  "
		echo '#########################'
		echo "# 1st arg is target file"
		echo "# 2nd arg is x column"
		echo "# 3rd arg is y column"
		echo "# 4th arg is start line"
	else
		python3 /home/sr4871/.commands/fft.py $1 $2 $3 $4
	fi
}
