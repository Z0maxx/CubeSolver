#include "f2l_edge_sequences.cuh"

__constant__ EdgeSolveSequence const_F2LEdgeSequences[16] =
{
	{
		Layer_Front,
		Cube_Left,
		Side_Front,
		{}
	},
	{
		Layer_Front,
		Cube_Left,
		Side_Left,
		{ F, Up, Fp, Up, Lp, U, L, Up, F, Up, Fp, Up, Lp, U, L }
	},
	{
		Layer_Front,
		Cube_Right,
		Side_Front,
		{ R, Up, Rp, Up, Fp, U, F2, Up, Fp, Up, Lp, U, L }
	},
	{
		Layer_Front,
		Cube_Right,
		Side_Right,
		{ R, Up, Rp, Up, Fp, U, F, U, Lp, U, L, U, F, Up, Fp }
	},
	{
		Layer_Front,
		Cube_Top,
		Side_Front,
		{ Up, Lp, U, L, U, F, Up, Fp }
	},
	{
		Layer_Front,
		Cube_Top,
		Side_Top,
		{ U2, F, Up, Fp, Up, Lp, U, L }
	},
	{
		Layer_Middle,
		Cube_Top_Left,
		Side_Left,
		{ U2, Lp, U, L, U, F, Up, Fp }
	},
	{
		Layer_Middle,
		Cube_Top_Left,
		Side_Top,
		{ U, F, Up, Fp, Up, Lp, U, L }
	},
	{
		Layer_Middle,
		Cube_Top_Right,
		Side_Right,
		{ Lp, U, L, U, F, Up, Fp }
	},
	{
		Layer_Middle,
		Cube_Top_Right,
		Side_Top,
		{ Up, F, Up, Fp, Up, Lp, U, L }
	},
	{
		Layer_Back,
		Cube_Left,
		Side_Back,
		{ Bp, U, B, U, L, Up, L2, U, L, U, F, Up, Fp }
	},
	{
		Layer_Back,
		Cube_Left,
		Side_Left,
		{ Bp, U, B, U, L, Up, Lp, Up, F, Up, Fp, Up, Lp, U, L }
	},
	{
		Layer_Back,
		Cube_Right,
		Side_Back,
		{ B, Up, Bp, Up, Rp, U, R, U2, Lp, U, L, U, F, Up, Fp }
	},
	{
		Layer_Back,
		Cube_Right,
		Side_Right,
		{ B, Up, Bp, Up, Rp, U, R, U, F, Up, Fp, Up, Lp, U, L }
	},
	{
		Layer_Back,
		Cube_Top,
		Side_Back,
		{ U, Lp, U, L, U, F, Up, Fp }
	},
	{
		Layer_Back,
		Cube_Top,
		Side_Top,
		{ F, Up, Fp, Up, Lp, U, L }
	}
};