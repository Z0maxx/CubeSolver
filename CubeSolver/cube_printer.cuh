#pragma once

#include <stdio.h>

#include "cuda_runtime.h"
#include "enums.h"

extern __host__ __device__ void printCube(const Color cube[3][9][6]);