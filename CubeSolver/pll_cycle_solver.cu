#include "pll_cycle_solver.cuh"

#ifdef __INTELLISENSE__
#define CUDA_KERNEL(...)
#else
#define CUDA_KERNEL(...) <<< __VA_ARGS__ >>>
#endif

__device__ bool setPLLCycleMatch(const int cubeIdx, const uint2 crossIdx, const uint2 cornerIdx, const uint2 edgeIdx, bool match[4])
{
	for (int i = 0; i < 4; i++)
	{
		Color colors[3]{};
		for (int j = 0; j < 3; j++)
		{
			colors[j] = dev_F2LEdgeCubeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y][const_PLLCycleReferences[i][j].layer][const_PLLCycleReferences[i][j].cube][const_PLLCycleReferences[i][j].side];
		}
		const uint2 corner = findCorner(dev_F2LEdgeCubeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y], colors, 4);
		match[i] = corner.x == const_PLLCycleCubeReferences[i].layer && corner.y == const_PLLCycleCubeReferences[i].cube;
	}
	int j = 0;
	while (j < 4 && match[j])
	{
		j++;
	}
	return j == 4;
}

__device__ void PLLCycleSolve(const int cubeIdx, const uint2 crossIdx, const uint2 cornerIdx, const uint2 edgeIdx)
{
	bool match[4]{};
	int idx = 0;
	while (!setPLLCycleMatch(cubeIdx, crossIdx, cornerIdx, edgeIdx, match))
	{
		const Notation* sequence = findPLLCycleSequence(match);
		executePLLCycleSequence(cubeIdx, crossIdx, cornerIdx, edgeIdx, sequence, idx);
		idx++;
	}
}

__global__ void solvePLLCycleThread()
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

	PLLCycleSolve(cubeIdx, crossIdx, cornerIdx, edgeIdx);
}

void solvePLLCycle()
{
	solvePLLCycleThread CUDA_KERNEL(dim3(6, 4, 6), dim3(24, 4, 6))();
	cudaDeviceSynchronize();
}