#pragma once

#include "cuda_runtime.h"
#include "enums.h"
#include "structs.h"

extern __constant__ Reference const_OLLEdgeTargetReferences[4];
extern __constant__ Reference const_OLLEdgeReferences[4];
extern __constant__ NearReference const_OLLEdgeNearReferences[4];