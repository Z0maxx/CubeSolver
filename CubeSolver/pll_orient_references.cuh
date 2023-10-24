#pragma once

#include "cuda_runtime.h"
#include "enums.h"
#include "structs.h"

extern __constant__ Reference const_PLLOrientReference;
extern __constant__ Reference const_PLLOrientTargetReferences[4];
extern __constant__ Reference const_PLLOrientCurrentTargetReference;
extern __constant__ Reference const_PLLOrientFinalReferences[2];