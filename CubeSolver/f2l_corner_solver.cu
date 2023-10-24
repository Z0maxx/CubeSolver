#include "f2l_corner_solver.cuh"

#ifdef __INTELLISENSE__
#define CUDA_KERNEL(...)
#else
#define CUDA_KERNEL(...) <<< __VA_ARGS__ >>>
#endif

__device__ int dev_F2LCornerRotations[6][4][6][4][6];

__device__ void solveF2LCornerPiece(const int cubeIdx, const uint2 crossIdx, const uint2 cornerIdx, const int idx, const int solveOrderIdx)
{
	SolveRotation solveRotation = findSolveRotation(dev_F2LCornerRotations[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y], solveOrderIdx);
	if (solveRotation.rotation != 99)
	{
		turnF2LCornerCube(cubeIdx, crossIdx, cornerIdx, solveRotation.direction, solveRotation.twice);
		dev_F2LCornerRotationMoves[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][idx] = solveRotation.notation;
		dev_F2LCornerRotations[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y] = solveRotation.newRotation;
	}
	Color colors[3]{};
	for (int i = 0; i < 3; i++)
	{
		colors[i] = dev_F2LCornerCubeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][const_F2LCornerReferences[i].layer][const_F2LCornerReferences[i].cube][const_F2LCornerReferences[i].side];
	}
	const uint2 corner = findCorner(dev_F2LCornerCubeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y], colors, 8);
	const Color targetColor = dev_F2LCornerCubeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][const_F2LCornerTargetReference.layer][const_F2LCornerTargetReference.cube][const_F2LCornerTargetReference.side];
	const Notation* sequence = findCornerSequence(const_F2LCornerSequences, corner, dev_F2LCornerCubeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][corner.x][corner.y], targetColor);
	executeF2LCornerSequence(cubeIdx, crossIdx, cornerIdx, sequence, idx);
}

__global__ void solveF2LCornerThread()
{
	const int cubeIdx = blockIdx.x;

	const int crossIdxX = blockIdx.y;
	const int crossIdxY = blockIdx.z;
	const uint2 crossIdx = make_uint2(crossIdxX, crossIdxY);

	const int cornerIdxX = threadIdx.x;
	const int cornerIdxY = threadIdx.y;
	const uint2 cornerIdx = make_uint2(cornerIdxX, cornerIdxY);

	for (int i = 0; i < 4; i++)
	{
		solveF2LCornerPiece(cubeIdx, crossIdx, cornerIdx, i, solveOrders[cornerIdx.x][cornerIdx.y][i]);
	}
}

__global__ void copyF2LCornerColorThread()
{
	memcpy(dev_F2LCornerCubeColors[blockIdx.x][blockIdx.y][blockIdx.z][threadIdx.x][threadIdx.y], dev_crossCubeColors[blockIdx.x][blockIdx.y][blockIdx.z], sizeof(dev_crossCubeColors[blockIdx.x][blockIdx.y][blockIdx.z]));
}

void solveF2LCorner()
{
	copyF2LCornerColorThread CUDA_KERNEL(dim3(6, 4, 6), dim3(4, 6))();
	cudaDeviceSynchronize();
	solveF2LCornerThread CUDA_KERNEL(dim3(6, 4, 6), dim3(4, 6))();
	cudaDeviceSynchronize();
}