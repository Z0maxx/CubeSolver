#pragma once

#include "cuda_runtime.h"
#include "enums.h"
#include "structs.h"

extern __device__ const Notation* findCornerSequence(CornerSolveSequence sequences[24], const uint2 edge, const Color colors[6], const Color targetColor);