#include "oll_cross_sequence_finder.cuh"

__device__ const Notation* findOLLCrossSequence(const bool match[4])
{
	for (int i = 0; i < 7; i++)
	{
		int j = 0;
		while (j < 4 && const_OLLCrossSequences[i].match[j] == match[j])
		{
			j++;
		}
		if (j == 4)
		{
			return const_OLLCrossSequences[i].sequence;
		}
	}

	return { 0 };
}