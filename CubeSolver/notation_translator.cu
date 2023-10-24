#include "notation_translator.cuh"

__host__ __device__ const TranslatedNotation translateNotation(Notation notation)
{
	switch (notation)
	{
		case L:
			return { true, false, Direction_Down, CubeLayer_Left};
		case Lp:
			return { true, false, Direction_Up, CubeLayer_Left };
		case L2:
			return { true, true, Direction_Up, CubeLayer_Left };

		case R:
			return { true, false, Direction_Up, CubeLayer_Right };
		case Rp:
			return { true, false, Direction_Down, CubeLayer_Right };
		case R2:
			return { true, true, Direction_Down, CubeLayer_Right };

		case F:
			return { true, false, Direction_Right, CubeLayer_Front };
		case Fp:
			return { true, false, Direction_Left, CubeLayer_Front };
		case F2:
			return { true, true, Direction_Left, CubeLayer_Front };

		case B:
			return { true, false, Direction_Left, CubeLayer_Back };
		case Bp:
			return { true, false, Direction_Right, CubeLayer_Back };
		case B2:
			return { true, true, Direction_Right, CubeLayer_Back };

		case U:
			return { true, false, Direction_Left, CubeLayer_Top };
		case Up:
			return { true, false, Direction_Right, CubeLayer_Top };
		case U2:
			return { true, true, Direction_Right, CubeLayer_Top };

		case D:
			return { true, false, Direction_Right, CubeLayer_Bottom };
		case Dp:
			return { true, false, Direction_Left, CubeLayer_Bottom };
		case D2:
			return { true, true, Direction_Left, CubeLayer_Bottom };

		case M:
			return { true, false, Direction_Down, CubeLayer_M };
		case Mp:
			return { true, false, Direction_Up, CubeLayer_M };
		case M2:
			return { true, true, Direction_Up, CubeLayer_M };

		case E:
			return { true, false, Direction_Right, CubeLayer_E };
		case Ep:
			return { true, false, Direction_Left, CubeLayer_E };
		case E2:
			return { true, true, Direction_Left, CubeLayer_E };

		case S:
			return { true, false, Direction_Left, CubeLayer_S };
		case Sp:
			return { true, false, Direction_Right, CubeLayer_S };
		case S2:
			return { true, true, Direction_Right, CubeLayer_S };

		case x:
			return { false, false, Direction_Up };
		case xp:
			return { false, false, Direction_Down };
		case x2:
			return { false, true, Direction_Down };

		case y:
			return { false, false, Direction_Left };
		case yp:
			return { false, false, Direction_Right };
		case y2:
			return { false, true, Direction_Right };

		case z:
			return { false, false, Direction_Tilt_Right };
		case zp:
			return { false, false, Direction_Tilt_Left };
		case z2:
			return { false, true, Direction_Tilt_Left };
		default:
			return {};
	}
}