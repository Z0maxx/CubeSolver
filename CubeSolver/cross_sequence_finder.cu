#include "cross_sequence_finder.cuh"

__device__ const Notation* findCrossSequence(const uint2 edge, const Color colors[6], const Color targetColor)
{
	for (int i = 0; i < 24; i++)
	{
		if (const_crossSequences[i].layer == edge.x && const_crossSequences[i].cube == edge.y && colors[const_crossSequences[i].side] == targetColor)
		{
			return const_crossSequences[i].sequence;
		}
	}
	return { 0 };
}