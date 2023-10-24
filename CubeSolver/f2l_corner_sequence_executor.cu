#include "f2l_corner_sequence_executor.cuh"

__device__ void executeF2LCornerSequence(const int cubeIdx, const uint2 crossIdx, const uint2 cornerIdx, const Notation sequence[], const int idx)
{
	int i = 0;
	while (i < 8 && sequence[i] != None)
	{
		dev_F2LCornerLayerMoves[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][idx][i] = sequence[i];
		const TranslatedNotation move = translateNotation(sequence[i]);
		turnF2LCornerLayer(cubeIdx, crossIdx, cornerIdx, move.cubeLayer, move.direction, move.twice);
		i++;
	}
}