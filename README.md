## Overview

This repo contains:
1. A list of `.bal` files that cover the feature scope of the various nBallerina implementation stages as defined here: [nBallerina in Ballerina staging](https://docs.google.com/document/d/1qcLqaTQea3xTdQtmH0SuIid6oMkHv-I0tvMkJxZV6JM/edit?usp=sharing)
2. Each `.bal` has a corresponding `.ll` file (with the same filename) that contains the corresponding LLVM IR
3. The `.bal` files also contain a [LLVM LIT](https://llvm.org/docs/CommandGuide/lit.html) header and footer that can be used to as a form of unit test to verify the LLVM IR codegen
  * Note that this only enables a "compile time" check with limited ability to check the codegen correctness
  * A more extensive "runtime" test suite is required to verify the complete functionality. This will involve compiling the LLVM IR with clang, executing the resulting binary and verifying its output.

### Implementation sub tasks

The recommended implementation order is implied via the step_* folder structure.

### Prerequisites for LIT
* `sudo apt install python3-pip`
* `pip3 install lit filecheck`

To execute the LIT tests, update place holder runner command in the `.bal` file headers with the correct runner command and execute `./lit_runner.py -v .`
