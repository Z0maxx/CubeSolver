#pragma once

#include "cuda_runtime.h"
#include "structs.h"

extern __device__ const SolveRotation findSolveRotation(const int rotation, const int solveOrderIdx);