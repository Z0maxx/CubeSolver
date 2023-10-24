#include "pll_cycle_sequence_finder.cuh"

__device__ const Notation* findPLLCycleSequence(const bool match[4])
{
	for (int i = 0; i < 5; i++)
	{
		int j = 0;
		while (j < 4 && const_PLLCycleSequences[i].match[j] == match[j])
		{
			j++;
		}
		if (j == 4)
		{
			return const_PLLCycleSequences[i].sequence;
		}
	}

	return { 0 };
}