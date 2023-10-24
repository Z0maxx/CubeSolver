#include "corner_sequence_finder.cuh"

__device__ const Notation* findCornerSequence(CornerSolveSequence sequences[24], const uint2 edge, const Color colors[6], const Color targetColor)
{
	for (int i = 0; i < 24; i++)
	{
		if (sequences[i].layer == edge.x && sequences[i].cube == edge.y && colors[sequences[i].side] == targetColor)
		{
			return sequences[i].sequence;
		}
	}
	return { 0 };
}