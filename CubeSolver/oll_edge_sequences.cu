#include "oll_edge_sequences.cuh"

__constant__ MatchNearSequence const_OLLEdgeSequences[15] =
{
	{
		{ true, false, false, false },
		{ U, R, U, Rp, U, R, U2, Rp, U },
		{ false, true, true, false },
	},
	{
		{ true, false, false, false },
		{ Up, B, U, Bp, U, B, U2, Bp, U },
		{ false, true, false, true },
	},
	{
		{ false, true, false, false },
		{ U, L, U, Lp, U, L, U2, Lp, U },
		{ true, false, false, true }
	},
	{
		{ false, true, false, false },
		{ Up, F, U, Fp, U, F, U2, Fp, U },
		{ true, false, true, false }
	},
	{
		{ false, false, true, false },
		{ U, F, U, Fp, U, F, U2, Fp, U },
		{ false, true, false, true }
	},
	{
		{ false, false, true, false },
		{ Up, R, U, Rp, U, R, U2, Rp, U },
		{ true, false, false, true }
	},
	{
		{ false, false, false, true },
		{ U, B, U, Bp, U, B, U2, Bp, U },
		{ true, false, true, false }
	},
	{
		{ false, false, false, true },
		{ Up, L, U, Lp, U, L, U2, Lp, U },
		{ false, true, true, false }
	},
	{
		{ true, true, true, true, },
		{}
	},
	{
		{ true, false, true, false},
		{ L, U, Lp, U, L, U2, Lp, U }
	},
	{
		{ false, true, true, false },
		{ B, U, Bp, U, B, U2, Bp, U }
	},
	{
		{ false, true, false, true },
		{ R, U, Rp, U, R, U2, Rp, U }
	},
	{
		{ true, false, false, true },
		{ F, U, Fp, U, F, U2, Fp, U }
	},
	{
		{ true, true, false, false },
		{ R, U, Rp, U, R, U2, Rp, F, U, Fp, U, F, U2, Fp, U }
	},
	{
		{ false, false, true, true },
		{ B, U, Bp, U, B, U2, Bp, R, U, Rp, U, R, U2, Rp, U }
	}
};