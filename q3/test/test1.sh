#! /bin/bash

# remember where we were
CURRENT_DIR="$(pwd)"

# get the question number and set the appropriate variables
QUESTION=$1
PROGRAM="${CURRENT_DIR}/bin/${QUESTION}.out"

INPUT="${CURRENT_DIR}/test/t1.input.txt"
OUTPUT="${CURRENT_DIR}/test/t1.output.txt"

echo "running test:\n ${PROGRAM} < ${INPUT} > ${OUTPUT}"
# run the program on the input
${PROGRAM} < ${INPUT} > ${OUTPUT}

python ${CURRENT_DIR}/test/testq3.py ${OUTPUT}
