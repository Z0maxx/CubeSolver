#include "oll_edge_solver.cuh"

#ifdef __INTELLISENSE__
#define CUDA_KERNEL(...)
#else
#define CUDA_KERNEL(...) <<< __VA_ARGS__ >>>
#endif

__device__ bool setOLLEdgeMatch(const int cubeIdx, const uint2 crossIdx, const uint2 cornerIdx, const uint2 edgeIdx, bool match[4])
{
	for (int i = 0; i < 4; i++)
	{
		const Color color = dev_F2LEdgeCubeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y][const_OLLEdgeReferences[i].layer][const_OLLEdgeReferences[i].cube][const_OLLEdgeReferences[i].side];
		const Color targetColor = dev_F2LEdgeCubeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y][const_OLLEdgeTargetReferences[i].layer][const_OLLEdgeTargetReferences[i].cube][const_OLLEdgeTargetReferences[i].side];
		match[i] = color == targetColor;
	}
	int j = 0;
	while (j < 4 && !match[j])
	{
		j++;
	}
	return j < 4;
}

__device__ void setOLLEdgeNear(const int cubeIdx, const uint2 crossIdx, const uint2 cornerIdx, const uint2 edgeIdx, bool near[4])
{
	for (int i = 0; i < 4; i++)
	{
		const Color origin = dev_F2LEdgeCubeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y][const_OLLEdgeNearReferences[i].origin.layer][const_OLLEdgeNearReferences[i].origin.cube][const_OLLEdgeNearReferences[i].origin.side];
		const Color leftTarget = dev_F2LEdgeCubeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y][const_OLLEdgeNearReferences[i].leftTarget.layer][const_OLLEdgeNearReferences[i].leftTarget.cube][const_OLLEdgeNearReferences[i].leftTarget.side];
		const Color rightTarget = dev_F2LEdgeCubeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y][const_OLLEdgeNearReferences[i].rightTarget.layer][const_OLLEdgeNearReferences[i].rightTarget.cube][const_OLLEdgeNearReferences[i].rightTarget.side];
		near[i] = origin == leftTarget || origin == rightTarget;
	}
}

__device__ void OLLEdgeSolve(const int cubeIdx, const uint2 crossIdx, const uint2 cornerIdx, const uint2 edgeIdx)
{
	Notation firstMove = None;
	bool match[4]{};
	int i = 0;
	while (!setOLLEdgeMatch(cubeIdx, crossIdx, cornerIdx, edgeIdx, match))
	{
		turnF2LEdgeLayer(cubeIdx, crossIdx, cornerIdx, edgeIdx, CubeLayer_Top, Direction_Left, false);
		i++;
	}
	switch (i)
	{
	case 1:
		firstMove = U;
		break;
	case 2:
		firstMove = U2;
		break;
	case 3:
		firstMove = Up;
		break;
	}
	
	dev_OLLEdgeLayerMoves[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y][0] = firstMove;
	bool near[4]{};
	setOLLEdgeNear(cubeIdx, crossIdx, cornerIdx, edgeIdx, near);
	const Notation* sequence = findOLLEdgeSequence(match, near);
	executeOLLEdgeSequence(cubeIdx, crossIdx, cornerIdx, edgeIdx, sequence);
}

__global__ void solveOLLEdgeThread()
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

	OLLEdgeSolve(cubeIdx, crossIdx, cornerIdx, edgeIdx);
}

void solveOLLEdge()
{
	solveOLLEdgeThread CUDA_KERNEL(dim3(6, 4, 6), dim3(24, 4, 6))();
	cudaDeviceSynchronize();
}