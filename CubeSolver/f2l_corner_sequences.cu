#include "f2l_corner_sequences.cuh"

__constant__ CornerSolveSequence const_F2LCornerSequences[24] =
{
	{
		Layer_Front,
		Cube_Bottom_Left,
		Side_Front,
		{}
	},
	{
		Layer_Front,
		Cube_Bottom_Left,
		Side_Left,
		{ Lp, U, L, F, U, Fp }
	},
	{
		Layer_Front,
		Cube_Bottom_Left,
		Side_Bottom,
		{ F, Up, Fp, Lp, Up, L }
	},
	{
		Layer_Front,
		Cube_Bottom_Right,
		Side_Right,
		{ R, U, Rp, Lp, Up, L }
	},
	{
		Layer_Front,
		Cube_Bottom_Right,
		Side_Front,
		{ R, U, Rp, F, U, Fp }
	},
	{
		Layer_Front,
		Cube_Bottom_Right,
		Side_Bottom,
		{ R, Up, Rp, U, Lp, Up, L }
	},
	{
		Layer_Front,
		Cube_Top_Left,
		Side_Top,
		{ F, U, Fp }
	},
	{
		Layer_Front,
		Cube_Top_Left,
		Side_Front,
		{ Lp, Up, L }
	},
	{
		Layer_Front,
		Cube_Top_Left,
		Side_Left,
		{ F, R, U2, Rp, Fp }
	},
	{
		Layer_Front,
		Cube_Top_Right,
		Side_Right,
		{ U, Lp, Up, L }
	},
	{
		Layer_Front,
		Cube_Top_Right,
		Side_Top,
		{ Lp, U, L }
	},
	{
		Layer_Front,
		Cube_Top_Right,
		Side_Front,
		{ U, F, R, U2, Rp, Fp }
	},
	{
		Layer_Back,
		Cube_Bottom_Left,
		Side_Left,
		{ Bp, Up, B, F, U, Fp }
	},
	{
		Layer_Back,
		Cube_Bottom_Left,
		Side_Bottom,
		{ Bp, Up, B, Lp, Up, L }
	},
	{
		Layer_Back,
		Cube_Bottom_Left,
		Side_Back,
		{ Bp, U, B, Up, F, U, Fp }
	},
	{
		Layer_Back,
		Cube_Bottom_Right,
		Side_Back,
		{ B, U2, Bp, Lp, Up, L }
	},
	{
		Layer_Back,
		Cube_Bottom_Right,
		Side_Bottom,
		{ Rp, U2, R, Lp, Up, L }
	},
	{
		Layer_Back,
		Cube_Bottom_Right,
		Side_Right,
		{ B, U2, Bp, F, U, Fp }
	},
	{
		Layer_Back,
		Cube_Top_Left,
		Side_Left,
		{ F, Up, Fp }
	},
	{
		Layer_Back,
		Cube_Top_Left,
		Side_Top,
		{ Up, F, U, Fp }
	},
	{
		Layer_Back,
		Cube_Top_Left,
		Side_Back,
		{ Up, F, R, U2, Rp, Fp }
	},
	{
		Layer_Back,
		Cube_Top_Right,
		Side_Back,
		{ F, U2, Fp }
	},
	{
		Layer_Back,
		Cube_Top_Right,
		Side_Top,
		{ Lp, U2, L }
	},
	{
		Layer_Back,
		Cube_Top_Right,
		Side_Right,
		{ U2, F, R, U2, Rp, Fp }
	}
};