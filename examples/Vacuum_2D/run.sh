#!/bin/bash

# Generate the initial conditions if they are not present.
if [ ! -e glassPlane_128.hdf5 ]
then
    echo "Fetching initial glass file for the 1D vacuum expansion example..."
    ./getGlass.sh
fi
if [ ! -e vacuum.hdf5 ]
then
    echo "Generating initial conditions for the 1D vacuum expansion example..."
    python makeIC.py
fi

# Run SWIFT
../swift -s -t 4 vacuum.yml 2>&1 | tee output.log

# Plot the result
python plotSolution.py 1
