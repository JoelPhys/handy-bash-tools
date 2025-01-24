import matplotlib.pyplot as plt
import numpy as np
import sys


def main(argv):


    # read column numbers from commandline
    filename = sys.argv[1]
    xcol = int(sys.argv[2])-1
    ycol = int(sys.argv[3])-1
    startline = int(sys.argv[4])-1

    # read file
    #xy= np.loadtxt("mag_tsteps_400000_T_0300.out",usecols=[xcol,ycol])
    xy_temp = np.loadtxt(filename,usecols=[xcol,ycol])

    # remove all rows before desired startline
    xy = xy_temp[startline:]
    
    # convert to 1d array
    xvals = xy[:,0]
    yvals = xy[:,1]

    # get timestep
    timestep = xvals[1] - xvals[0]

    # sampling freq
    Fs = 1.0/timestep

    # length of time signal
    signal_length = np.size(xvals)

    # compute fft
    Y = np.fft.fft(yvals)
    
    # Compute the two-sided spectrum P2. Then compute the single-sided spectrum P1 based on P2 and the even-valued signal length.
    P2 = Y/signal_length
    P2 = np.absolute(P2)
    
    # freq array
    f = Fs * np.arange(0,int(signal_length/2))/signal_length
    
    # combine arrays
    output = np.vstack((f, P2[:int(signal_length/2)])).T
    
    # print to stdout
    np.savetxt(sys.stdout, output, fmt='%.8e')

    # plt.plot(f,P2[:int(signal_length/2)])
    # plt.yscale('log')
    # plt.show()

if __name__ == "__main__":
    main(sys.argv)
