#!/bin/bash

cd ../build
ninja

cd tests

run_gcc_script512() {
    ./speed_kem kyber512
}
run_gcc_script768() {
    ./speed_kem kyber768
}
run_gcc_script1024() {
    ./speed_kem kyber1024
}

rm -f benchmark_hpc.csv

echo
echo "Benchmarking..."

# Run the Python script for 30 iterations
for ((i = 1; i <= 30; i++)); do
    echo "Started Iteration $i."
    echo "$i" >> benchmark_hpc.csv
    # Run the Python script and append the benchmark_hpc to the CSV file
    run_gcc_script512 >> benchmark_hpc.csv
    run_gcc_script768 >> benchmark_hpc.csv
    run_gcc_script1024 >> benchmark_hpc.csv
    echo "" >> benchmark_hpc.csv
done

echo "Done."