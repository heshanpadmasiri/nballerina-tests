## Overview

This repo contains:
1. A list of `.bal` files that cover the feature scope of the various nBallerina implementation stages as defined here: [nBallerina in Ballerina staging](https://docs.google.com/document/d/1qcLqaTQea3xTdQtmH0SuIid6oMkHv-I0tvMkJxZV6JM/edit?usp=sharing)
2. Each `.bal` has a corresponding `.ll` file (with the same filename) that contains the corresponding LLVM IR
3. The `.bal` files also contain a [LLVM LIT](https://llvm.org/docs/CommandGuide/lit.html) header and footer that can be used to as a form of unit test to verify the LLVM IR codegen
  * Note that this only enables a "compile time" check with limited ability to check the codegen correctness
  * A more extensive "runtime" test suite is required to verify the complete functionality. This will involve compiling the LLVM IR with clang, executing the resulting binary and verifying its output. This testing scope can be handled as part of the integration test suite; which can also use the same LIT framework. 
4. The recommended implementation order is implied via the step_* folder structure.

### Implementation notes

Unary negative, multiplication, addition and subtraction operator implementations use LLVM's [arithmetic with overflow](https://llvm.org/docs/LangRef.html#arithmetic-with-overflow-intrinsics) instructions. These compile down to an efficient "jump on overflow" assembly instruction ([ref](https://godbolt.org/z/qnrd9EaEf)). 

For overflows resulting from division operations (and reminder operations) don't set the overflow bit, but rather trigger a hardware exception in x86 ([ref](https://stackoverflow.com/questions/3892379/causing-a-divide-overflow-error-x86)). As such, a less efficient branching logic that checks the operands were used for these operators ([ref](https://wiki.sei.cmu.edu/confluence/display/c/INT32-C.+Ensure+that+operations+on+signed+integers+do+not+result+in+overflow)).

These .ll tests all call `abort()` when an runtime overflow is detected. In production, these calls need to be replaced with an invocation of nBallerina's stack unwind mechanism instead.

### Prerequisites for LIT
* `sudo apt install python3-pip`
* `pip3 install lit filecheck`

To execute the LIT tests, update place holder runner command in the `.bal` file headers with the correct runner command and execute `./lit_runner.py -v .`
