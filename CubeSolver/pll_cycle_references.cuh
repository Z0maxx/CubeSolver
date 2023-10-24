#pragma once

#include "cuda_runtime.h"
#include "enums.h"
#include "structs.h"

extern __constant__ Reference const_PLLCycleReferences[4][3];
extern __constant__ CubeReference const_PLLCycleCubeReferences[4];