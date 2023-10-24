#include "cross_sequence_executor.cuh"

__device__ void executeCrossSequence(const int cubeIdx, const uint2 crossIdx, const Notation sequence[], const int idx)
{
	int i = 0;
	while (i < 4 && sequence[i] != None)
	{
		dev_crossLayerMoves[cubeIdx][crossIdx.x][crossIdx.y][idx][i] = sequence[i];
		const TranslatedNotation move = translateNotation(sequence[i]);
		turnCrossLayer(cubeIdx, crossIdx, move.cubeLayer, move.direction, move.twice);
		i++;
	}
}