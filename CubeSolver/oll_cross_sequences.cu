#include "oll_cross_sequences.cuh"

__constant__ MatchSequence const_OLLCrossSequences[7]
{
	{
		{ false, false, false, false },
		{ F, R, U, Rp, Up, Fp }
	},
	{
		{ false, true, true, false },
		{ F, R, U, Rp, Up, Fp }
	},
	{
		{ false, false, true, true },
		{ F, R, U, Rp, Up, Fp }
	},
	{
		{ false, true, false, true },
		{ L, F, U, Fp, Up, Lp }
	},
	{
		{ true, false, false, true },
		{ B, L, U, Lp, Up, Bp }
	},
	{
		{ true, false, true, false },
		{ R, B, U, Bp, Up, Rp }
	},
	{
		{ true, true, false, false },
		{ L, F, U, Fp, Up, Lp }
	}
};