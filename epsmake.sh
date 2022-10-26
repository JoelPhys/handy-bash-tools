function epsmake() {
	a=$1
	b=${a%.*}
	gnuplot ${a}
	latex "${b}.tex"
	dvipdf "${b}.dvi"
	open "${b}.pdf"
}
