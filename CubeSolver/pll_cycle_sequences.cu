#include "pll_cycle_sequences.cuh"

__constant__ MatchSequence const_PLLCycleSequences[5] =
{
	{
		{ false, false, false, false },
		{ U, R, Up, Lp, U, Rp, Up, L }
	},
	{
		{ false, false, false, true },
		{ U, R, Up, Lp, U, Rp, Up, L }
	},
	{
		{ true, false, false, false },
		{ U, F, Up, Bp, U, Fp, Up, B }
	},
	{
		{ false, true, false, false },
		{ U, L, Up, Rp, U, Lp, Up, R }
	},
	{
		{ false, false, true, false },
		{ U, B, Up, Fp, U, Bp, Up, F }
	}
};