#include "sequence_processor.cuh"

#ifdef __INTELLISENSE__
#define CUDA_KERNEL(...)
#else
#define CUDA_KERNEL(...) <<< __VA_ARGS__ >>>
#endif

__device__ int dev_movesCountIdx[82944];
__device__ int dev_movesCount[82944];

__global__ void setMovesThread()
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

	int idx = cubeIdx * 13824 + crossIdx.x * 3456 + crossIdx.y * 576 + cornerIdx.x * 144 + cornerIdx.y * 24 + edgeIdx.x * 6 + edgeIdx.y;
	dev_movesCountIdx[idx] = idx;

	dev_moves[idx][0] = dev_cubeRotationMoves[cubeIdx];
	int pos = 1;
	for (int i = 0; i < 4; i++)
	{
		dev_moves[idx][pos] = dev_crossRotationMoves[cubeIdx][crossIdx.x][crossIdx.y][i];
		pos++;
		for (int j = 0; j < 4; j++)
		{
			dev_moves[idx][pos] = dev_crossLayerMoves[cubeIdx][crossIdx.x][crossIdx.y][i][j];
			pos++;
		}
	}

	for (int i = 0; i < 4; i++)
	{
		dev_moves[idx][pos] = dev_F2LCornerRotationMoves[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][i];
		pos++;
		for (int j = 0; j < 8; j++)
		{
			dev_moves[idx][pos] = dev_F2LCornerLayerMoves[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][i][j];
			pos++;
		}
	}

	for (int i = 0; i < 4; i++)
	{
		dev_moves[idx][pos] = dev_F2LEdgeRotationMoves[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y][i];
		pos++;
		for (int j = 0; j < 16; j++)
		{
			dev_moves[idx][pos] = dev_F2LEdgeLayerMoves[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y][i][j];
			pos++;
		}
	}

	for (int i = 0; i < 3; i++)
	{
		for (int j = 0; j < 6; j++)
		{
			dev_moves[idx][pos] = dev_OLLCrossLayerMoves[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y][i][j];
			pos++;
		}
	}

	for (int i = 0; i < 16; i++)
	{
		dev_moves[idx][pos] = dev_OLLEdgeLayerMoves[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y][i];
		pos++;
	}

	for (int i = 0; i < 3; i++)
	{
		for (int j = 0; j < 8; j++)
		{
			dev_moves[idx][pos] = dev_PLLCycleLayerMoves[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y][i][j];
			pos++;
		}
	}

	for (int i = 0; i < 4; i++)
	{
		for (int j = 0; j < 4; j++)
		{
			for (int k = 0; k < 5; k++)
			{
				dev_moves[idx][pos] = dev_PLLOrientLayerMoves[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y][i][j][k];
				pos++;
			}
		}
	}
}

void setMoves()
{
	setMovesThread CUDA_KERNEL(dim3(6, 4, 6), dim3(24, 4, 6))();
	cudaDeviceSynchronize();
}

__global__ void setMovesCountThread()
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

	const int idx = cubeIdx * 13824 + crossIdx.x * 3456 + crossIdx.y * 576 + cornerIdx.x * 144 + cornerIdx.y * 24 + edgeIdx.x * 6 + edgeIdx.y;

	int count = 0;
	Notation last = None;
	int lastIdx = -1;

	for (int i = 0; i < 263; i++)
	{
		Notation current = dev_moves[idx][i];
		if (current != None)
		{
			if (lastIdx != -1)
			{
				if (abs(current - last) == 1 && (current % 3 == 1 && last % 3 == 2 || current % 3 == 2 && last % 3 == 1) ||
					current == last && current % 3 == 0)
				{
					dev_moves[idx][i] = None;
					dev_moves[idx][lastIdx] = None;
					count--;
				}

				else if (current == last && current % 3 != 0)
				{
					int newMove = current + 2;
					if (current % 3 == 2)
					{
						newMove = current + 1;
					}
					dev_moves[idx][i] = (Notation)newMove;
					dev_moves[idx][lastIdx] = None;
				}

				else if (abs(current - last) == 2 && (current % 3 == 0 && last % 3 == 1 || current % 3 == 1 && last % 3 == 0))
				{
					dev_moves[idx][i] = (Notation)((current < last ? current : last) + 1);
					dev_moves[idx][lastIdx] = None;
				}

				else if (abs(current - last) == 1 && (current % 3 == 0 && last % 3 == 2 || current % 3 == 2 && last % 3 == 0))
				{
					dev_moves[idx][i] = (Notation)((current < last ? current : last) - 1);
					dev_moves[idx][lastIdx] = None;
				}

				else {
					count++;
				}
			}
			else
			{
				count++;
			}

			if (dev_moves[idx][i] != None)
			{
				last = dev_moves[idx][i];
				lastIdx = i;
			}
			else if (lastIdx != -1)
			{
				if (dev_moves[idx][lastIdx] == None)
				{
					int j = lastIdx;
					while (j > -1 && dev_moves[idx][j] == None)
					{
						j--;
					}
					if (j != -1)
					{
						last = dev_moves[idx][j];
					}
					lastIdx = j;
				}
			}
		}

	}
	dev_movesCount[idx] = count;
}

void setMovesCount()
{
	setMovesCountThread CUDA_KERNEL(dim3(6, 4, 6), dim3(24, 4, 6))();
	cudaDeviceSynchronize();
}

__global__ void setSequenceThread(const int needed)
{
	const int idx = blockIdx.x * 1024 + threadIdx.x;
	if (idx < needed)
	{
		const int idx1 = idx * 2;
		const int idx2 = idx1 + 1;
		const int a = dev_movesCount[idx1];
		const int b = dev_movesCount[idx2];
		const bool first = a < b;
		dev_movesCount[idx] = first ? a : b;
		dev_movesCountIdx[idx] = first ? dev_movesCountIdx[idx1] : dev_movesCountIdx[idx2];
	}
	if (needed == 1)
	{
		printf("%d moves\n", dev_movesCount[0]);
		memcpy(dev_sequence, dev_moves[dev_movesCountIdx[0]], sizeof(dev_sequence));
	}
}

void setSequence()
{
	int needed = 41472;
	while (needed != 0)
	{
		setSequenceThread CUDA_KERNEL(ceil((double)needed / 1024), needed > 1024 ? 1024 : needed)(needed);
		cudaDeviceSynchronize();
		if (needed > 1)
		{
			needed = ceil((double)needed / 2);
		}
		else
		{
			needed = 0;
		}
	}
}
void findSequence()
{
	setMoves();
	setMovesCount();
	setSequence();
}