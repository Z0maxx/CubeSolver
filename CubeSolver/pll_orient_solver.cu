#include "pll_orient_solver.cuh"

#ifdef __INTELLISENSE__
#define CUDA_KERNEL(...)
#else
#define CUDA_KERNEL(...) <<< __VA_ARGS__ >>>
#endif

__device__ bool isPLLOrientCorrect(const int cubeIdx, const uint2 crossIdx, const uint2 cornerIdx, const uint2 edgeIdx, const Color targetColor)
{
	int j = 0;
	while (j < 4 && dev_F2LEdgeCubeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y][const_PLLOrientTargetReferences[j].layer][const_PLLOrientTargetReferences[j].cube][const_PLLOrientTargetReferences[j].side] == targetColor)
	{
		j++;
	}
	return j == 4;
}

__device__ bool isPLLOrientCurrentCorrect(const int cubeIdx, const uint2 crossIdx, const uint2 cornerIdx, const uint2 edgeIdx, const Color targetColor)
{
	return dev_F2LEdgeCubeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y][const_PLLOrientCurrentTargetReference.layer][const_PLLOrientCurrentTargetReference.cube][const_PLLOrientCurrentTargetReference.side] == targetColor;
}

__device__ bool isPLLOrientTopLayerCorrect(const int cubeIdx, const uint2 crossIdx, const uint2 cornerIdx, const uint2 edgeIdx, const Color targetColor)
{
	return dev_F2LEdgeCubeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y][const_PLLOrientFinalReferences[0].layer][const_PLLOrientFinalReferences[0].cube][const_PLLOrientFinalReferences[0].side] == targetColor;
}

__device__ void PLLOrientSolve(const int cubeIdx, const uint2 crossIdx, const uint2 cornerIdx, const uint2 edgeIdx)
{
	Color targetColor = dev_F2LEdgeCubeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y][const_PLLOrientReference.layer][const_PLLOrientReference.cube][const_PLLOrientReference.side];
	int idx = 0;
	int roundIdx = 0;
	bool correct = isPLLOrientCorrect(cubeIdx, crossIdx, cornerIdx, edgeIdx, targetColor);
	while (!correct)
	{
		bool currentCorrect = isPLLOrientCurrentCorrect(cubeIdx, crossIdx, cornerIdx, edgeIdx, targetColor);
		roundIdx = 0;
		while (!currentCorrect)
		{
			executePLLOrientSequence(cubeIdx, crossIdx, cornerIdx, edgeIdx, idx, roundIdx);
			currentCorrect = isPLLOrientCurrentCorrect(cubeIdx, crossIdx, cornerIdx, edgeIdx, targetColor);
			if (!currentCorrect)
			{
				roundIdx++;
			}

		}
		correct = isPLLOrientCorrect(cubeIdx, crossIdx, cornerIdx, edgeIdx, targetColor);
		if (!correct)
		{
			turnF2LEdgeLayer(cubeIdx, crossIdx, cornerIdx, edgeIdx, CubeLayer_Top, Direction_Left, false);
			dev_PLLOrientLayerMoves[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y][idx][roundIdx][4] = U;
			idx++;
		}
	}
	int i = 0;
	targetColor = dev_F2LEdgeCubeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y][const_PLLOrientFinalReferences[1].layer][const_PLLOrientFinalReferences[1].cube][const_PLLOrientFinalReferences[1].side];
	while (!isPLLOrientTopLayerCorrect(cubeIdx, crossIdx, cornerIdx, edgeIdx, targetColor))
	{
		turnF2LEdgeLayer(cubeIdx, crossIdx, cornerIdx, edgeIdx, CubeLayer_Top, Direction_Left, false);
		i++;
	}

	Notation lastMove = None;
	switch (i)
	{
	case 1:
		lastMove = U;
		break;
	case 2:
		lastMove = U2;
		break;
	case 3:
		lastMove = Up;
		break;
	}

	dev_PLLOrientLayerMoves[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y][idx][roundIdx][4] = lastMove;
}

__global__ void solvePLLOrientThread()
{
	const int cubeIdx = blockIdx.x;

	const int crossIdxX = blockIdx.y;
	const int crossIdxY = blockIdx.z;
	const uint2 crossIdx = make_uint2(crossIdxX, crossIdxY);

	const int cornerIdxX = threadIdx.x % 4;
	const int cornerIdxY = threadIdx.x / 4;
	const uint2 cornerIdx = make_uint2(cornerIdxX, cornerIdxY);

	const int edgeIdxX = threadIdx.y;
	const int edgeIdxY = threadIdx.z;
	const uint2 edgeIdx = make_uint2(edgeIdxX, edgeIdxY);

	PLLOrientSolve(cubeIdx, crossIdx, cornerIdx, edgeIdx);
}

void solvePLLOrient()
{
	solvePLLOrientThread CUDA_KERNEL(dim3(6, 4, 6), dim3(24, 4, 6))();
	cudaDeviceSynchronize();
}