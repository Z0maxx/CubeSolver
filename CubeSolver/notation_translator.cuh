#pragma once

#include "cuda_runtime.h"
#include "enums.h"
#include "structs.h"

extern __host__ __device__ const TranslatedNotation translateNotation(const Notation notation);