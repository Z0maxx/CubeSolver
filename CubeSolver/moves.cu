#include "structs.h"
#include "moves.cuh"

__constant__ const  Move rotateLayerColorsRightCornerMoves[4] = {
    {
        Cube_Top_Left,
        {Side_Left, Side_Top},
        Cube_Bottom_Left,
        {Side_Bottom, Side_Left},
    },
    {
        Cube_Top_Right,
        {Side_Top, Side_Right},
        Cube_Top_Left,
        {Side_Left, Side_Top}
    },
    {
        Cube_Bottom_Left,
        {Side_Bottom, Side_Left},
        Cube_Bottom_Right,
        {Side_Right, Side_Bottom}
    },
    {
        Cube_Bottom_Right,
        {Side_Right, Side_Bottom},
        Cube_Top_Right,
        {Side_Top, Side_Right}
    }
};

__constant__ const  Move rotateLayerColorsRightEgdeMoves[4] = {
    {
        Cube_Top,
        {Side_Top},
        Cube_Left,
        {Side_Left}
    },
    {
        Cube_Left,
        {Side_Left},
        Cube_Bottom,
        {Side_Bottom}
    },
    {
        Cube_Right,
        {Side_Right},
        Cube_Top,
        {Side_Top}
    },
    {
        Cube_Bottom,
        {Side_Bottom},
        Cube_Right,
        {Side_Right}
    }
};

__constant__ const  Move rotateLayerColorsLeftCornerMoves[4] = {
    {
        Cube_Top_Left,
        {Side_Left, Side_Top},
        Cube_Top_Right,
        {Side_Top, Side_Right}
    },
    {
        Cube_Top_Right,
        {Side_Top, Side_Right},
        Cube_Bottom_Right,
        {Side_Right, Side_Bottom}
    },
    {
        Cube_Bottom_Left,
        {Side_Bottom, Side_Left},
        Cube_Top_Left,
        {Side_Left, Side_Top}
    },
    {
        Cube_Bottom_Right,
        {Side_Right, Side_Bottom},
        Cube_Bottom_Left,
        {Side_Bottom, Side_Left}
    }
};

__constant__ const  Move rotateLayerColorsLeftEgdeMoves[4] = {
    {
        Cube_Top,
        {Side_Top},
        Cube_Right,
        {Side_Right}
    },
    {
        Cube_Left,
        {Side_Left},
        Cube_Top,
        {Side_Top}
    },
    {
        Cube_Right,
        {Side_Right},
        Cube_Bottom,
        {Side_Bottom}
    },
    {
        Cube_Bottom,
        {Side_Bottom},
        Cube_Left,
        {Side_Left}
    }
};

__constant__ const  MoveWithLayer rotateFaceColorsYRightCornerMoves[8] = {
    {
        Layer_Front,
        Cube_Top_Left,
        {Side_Front, Side_Left},
        Layer_Back,
        Cube_Top_Left,
        {Side_Left, Side_Back}
    },
    {
        Layer_Front,
        Cube_Top_Right,
        {Side_Front, Side_Right},
        Layer_Front,
        Cube_Top_Left,
        {Side_Left, Side_Front}
    },
    {
        Layer_Front,
        Cube_Bottom_Left,
        {Side_Front, Side_Left},
        Layer_Back,
        Cube_Bottom_Left,
        {Side_Left, Side_Back}
    },
    {
        Layer_Front,
        Cube_Bottom_Right,
        {Side_Front, Side_Right},
        Layer_Front,
        Cube_Bottom_Left,
        {Side_Left, Side_Front}
    },
    {
        Layer_Back,
        Cube_Top_Left,
        {Side_Left, Side_Back},
        Layer_Back,
        Cube_Top_Right,
        {Side_Back, Side_Right}
    },
    {
        Layer_Back,
        Cube_Top_Right,
        {Side_Right, Side_Back},
        Layer_Front,
        Cube_Top_Right,
        {Side_Front, Side_Right}
    },
    {
        Layer_Back,
        Cube_Bottom_Left,
        {Side_Left, Side_Back},
        Layer_Back,
        Cube_Bottom_Right,
        {Side_Back, Side_Right}
    },
    {
        Layer_Back,
        Cube_Bottom_Right,
        {Side_Right, Side_Back},
        Layer_Front,
        Cube_Bottom_Right,
        {Side_Front, Side_Right}
    }
};

__constant__ const  MoveWithLayer rotateFaceColorsYRightEdgeMoves[12] = {
    {
        Layer_Front,
        Cube_Top,
        {Side_Front},
        Layer_Middle,
        Cube_Top_Left,
        {Side_Left}
    },
    {
        Layer_Front,
        Cube_Bottom,
        {Side_Front},
        Layer_Middle,
        Cube_Bottom_Left,
        {Side_Left}
    },
    {
        Layer_Middle,
        Cube_Top_Left,
        {Side_Left},
        Layer_Back,
        Cube_Top,
        {Side_Back}
    },
    {
        Layer_Middle,
        Cube_Top_Right,
        {Side_Right},
        Layer_Front,
        Cube_Top,
        {Side_Front}
    },
    {
        Layer_Middle,
        Cube_Bottom_Left,
        {Side_Left},
        Layer_Back,
        Cube_Bottom,
        {Side_Back}
    },
    {
        Layer_Middle,
        Cube_Bottom_Right,
        {Side_Right},
        Layer_Front,
        Cube_Bottom,
        {Side_Front}
    },
    {
        Layer_Back,
        Cube_Top,
        {Side_Back},
        Layer_Middle,
        Cube_Top_Right,
        {Side_Right}
    },
    {
        Layer_Back,
        Cube_Bottom,
        {Side_Back},
        Layer_Middle,
        Cube_Bottom_Right,
        {Side_Right}
    },
    {
        Layer_Front,
        Cube_Left,
        {Side_Left, Side_Front},
        Layer_Back,
        Cube_Left,
        {Side_Back, Side_Left}
    },
    {
        Layer_Front,
        Cube_Right,
        {Side_Front, Side_Right},
        Layer_Front,
        Cube_Left,
        {Side_Left, Side_Front}
    },
    {
        Layer_Back,
        Cube_Left,
        {Side_Left, Side_Back},
        Layer_Back,
        Cube_Right,
        {Side_Back, Side_Right}
    },
    {
        Layer_Back,
        Cube_Right,
        {Side_Right, Side_Back},
        Layer_Front,
        Cube_Right,
        {Side_Front, Side_Right}
    }
};

__constant__ const  MoveWithLayer rotateFaceColorsYRightCenterMoves[6] = {
    {
        Layer_Front,
        Cube_Center,
        {Side_Front},
        Layer_Middle,
        Cube_Left,
        {Side_Left}
    },
    {
        Layer_Middle,
        Cube_Left,
        {Side_Left},
        Layer_Back,
        Cube_Center,
        {Side_Back}
    },
    {
        Layer_Middle,
        Cube_Right,
        {Side_Right},
        Layer_Front,
        Cube_Center,
        {Side_Front}
    },
    {
        Layer_Back,
        Cube_Center,
        {Side_Back},
        Layer_Middle,
        Cube_Right,
        {Side_Right}
    },
    {
        Layer_Middle,
        Cube_Top,
        {Side_Top},
        Layer_Middle,
        Cube_Top,
        {Side_Top}
    },
    {
        Layer_Middle,
        Cube_Bottom,
        {Side_Bottom},
        Layer_Middle,
        Cube_Bottom,
        {Side_Bottom}
    }
};

__constant__ const  MoveWithLayer rotateFaceColorsYLeftCornerMoves[8] = {
    {
        Layer_Front,
        Cube_Top_Left,
        {Side_Front, Side_Left},
        Layer_Front,
        Cube_Top_Right,
        {Side_Right, Side_Front}
    },
    {
        Layer_Front,
        Cube_Top_Right,
        {Side_Front, Side_Right},
        Layer_Back,
        Cube_Top_Right,
        {Side_Right, Side_Back}
    },
    {
        Layer_Front,
        Cube_Bottom_Left,
        {Side_Front, Side_Left},
        Layer_Front,
        Cube_Bottom_Right,
        {Side_Right, Side_Front}
    },
    {
        Layer_Front,
        Cube_Bottom_Right,
        {Side_Front, Side_Right},
        Layer_Back,
        Cube_Bottom_Right,
        {Side_Right, Side_Back}
    },
    {
        Layer_Back,
        Cube_Top_Left,
        {Side_Left, Side_Back},
        Layer_Front,
        Cube_Top_Left,
        {Side_Front, Side_Left}
    },
    {
        Layer_Back,
        Cube_Top_Right,
        {Side_Right, Side_Back},
        Layer_Back,
        Cube_Top_Left,
        {Side_Back, Side_Left}
    },
    {
        Layer_Back,
        Cube_Bottom_Left,
        {Side_Left, Side_Back},
        Layer_Front,
        Cube_Bottom_Left,
        {Side_Front, Side_Left}
    },
    {
        Layer_Back,
        Cube_Bottom_Right,
        {Side_Right, Side_Back},
        Layer_Back,
        Cube_Bottom_Left,
        {Side_Back, Side_Left}
    }
};

__constant__ const  MoveWithLayer rotateFaceColorsYLeftEdgeMoves[12] = {
    {
        Layer_Front,
        Cube_Top,
        {Side_Front},
        Layer_Middle,
        Cube_Top_Right,
        {Side_Right}
    },
    {
        Layer_Front,
        Cube_Bottom,
        {Side_Front},
        Layer_Middle,
        Cube_Bottom_Right,
        {Side_Right}
    },
    {
        Layer_Middle,
        Cube_Top_Left,
        {Side_Left},
        Layer_Front,
        Cube_Top,
        {Side_Front}
    },
    {
        Layer_Middle,
        Cube_Top_Right,
        {Side_Right},
        Layer_Back,
        Cube_Top,
        {Side_Back}
    },
    {
        Layer_Middle,
        Cube_Bottom_Left,
        {Side_Left},
        Layer_Front,
        Cube_Bottom,
        {Side_Front}
    },
    {
        Layer_Middle,
        Cube_Bottom_Right,
        {Side_Right},
        Layer_Back,
        Cube_Bottom,
        {Side_Back}
    },
    {
        Layer_Back,
        Cube_Top,
        {Side_Back},
        Layer_Middle,
        Cube_Top_Left,
        {Side_Left}
    },
    {
        Layer_Back,
        Cube_Bottom,
        {Side_Back},
        Layer_Middle,
        Cube_Bottom_Left,
        {Side_Left}
    },
    {
        Layer_Front,
        Cube_Left,
        {Side_Left, Side_Front},
        Layer_Front,
        Cube_Right,
        {Side_Front, Side_Right}
    },
    {
        Layer_Front,
        Cube_Right,
        {Side_Front, Side_Right},
        Layer_Back,
        Cube_Right,
        {Side_Right, Side_Back}
    },
    {
        Layer_Back,
        Cube_Left,
        {Side_Left, Side_Back},
        Layer_Front,
        Cube_Left,
        {Side_Front, Side_Left}
    },
    {
        Layer_Back,
        Cube_Right,
        {Side_Right, Side_Back},
        Layer_Back,
        Cube_Left,
        {Side_Back, Side_Left}
    }
};

__constant__ const  MoveWithLayer rotateFaceColorsYLeftCenterMoves[6] = {
    {
        Layer_Front,
        Cube_Center,
        {Side_Front},
        Layer_Middle,
        Cube_Right,
        {Side_Right}
    },
    {
        Layer_Middle,
        Cube_Left,
        {Side_Left},
        Layer_Front,
        Cube_Center,
        {Side_Front}
    },
    {
        Layer_Middle,
        Cube_Right,
        {Side_Right},
        Layer_Back,
        Cube_Center,
        {Side_Back}
    },
    {
        Layer_Back,
        Cube_Center,
        {Side_Back},
        Layer_Middle,
        Cube_Left,
        {Side_Left}
    },
    {
        Layer_Middle,
        Cube_Top,
        {Side_Top},
        Layer_Middle,
        Cube_Top,
        {Side_Top}
    }
    ,
    {
        Layer_Middle,
        Cube_Bottom,
        {Side_Bottom},
        Layer_Middle,
        Cube_Bottom,
        {Side_Bottom}
    }
};

__constant__ const  MoveWithLayer rotateFaceColorsXUpCornerMoves[8] = {
    {
        Layer_Front,
        Cube_Top_Left,
        {Side_Front, Side_Top},
        Layer_Front,
        Cube_Bottom_Left,
        {Side_Bottom, Side_Front}
    },
    {
        Layer_Front,
        Cube_Top_Right,
        {Side_Front, Side_Top},
        Layer_Front,
        Cube_Bottom_Right,
        {Side_Bottom, Side_Front}
    },
    {
        Layer_Front,
        Cube_Bottom_Left,
        {Side_Front, Side_Bottom},
        Layer_Back,
        Cube_Bottom_Left,
        {Side_Bottom, Side_Back}
    },
    {
        Layer_Front,
        Cube_Bottom_Right,
        {Side_Front, Side_Bottom},
        Layer_Back,
        Cube_Bottom_Right,
        {Side_Bottom, Side_Back}
    },
    {
        Layer_Back,
        Cube_Top_Left,
        {Side_Top, Side_Back},
        Layer_Front,
        Cube_Top_Left,
        {Side_Front, Side_Top}
    },
    {
        Layer_Back,
        Cube_Top_Right,
        {Side_Top, Side_Back},
        Layer_Front,
        Cube_Top_Right,
        {Side_Front, Side_Top}
    },
    {
        Layer_Back,
        Cube_Bottom_Left,
        {Side_Back, Side_Bottom},
        Layer_Back,
        Cube_Top_Left,
        {Side_Top, Side_Back}
    },
    {
        Layer_Back,
        Cube_Bottom_Right,
        {Side_Back, Side_Bottom},
        Layer_Back,
        Cube_Top_Right,
        {Side_Top, Side_Back}
    }
};

__constant__ const  MoveWithLayer rotateFaceColorsXUpEdgeMoves[12] = {
    {
        Layer_Front,
        Cube_Left,
        {Side_Front},
        Layer_Middle,
        Cube_Bottom_Left,
        {Side_Bottom}
    },
    {
        Layer_Front,
        Cube_Right,
        {Side_Front},
        Layer_Middle,
        Cube_Bottom_Right,
        {Side_Bottom}
    },
    {
        Layer_Middle,
        Cube_Top_Left,
        {Side_Top},
        Layer_Front,
        Cube_Left,
        {Side_Front}
    },
    {
        Layer_Middle,
        Cube_Top_Right,
        {Side_Top},
        Layer_Front,
        Cube_Right,
        {Side_Front}
    },
    {
        Layer_Middle,
        Cube_Bottom_Left,
        {Side_Bottom},
        Layer_Back,
        Cube_Left,
        {Side_Back}
    },
    {
        Layer_Middle,
        Cube_Bottom_Right,
        {Side_Bottom},
        Layer_Back,
        Cube_Right,
        {Side_Back}
    },
    {
        Layer_Back,
        Cube_Left,
        {Side_Back},
        Layer_Middle,
        Cube_Top_Left,
        {Side_Top}
    },
    {
        Layer_Back,
        Cube_Right,
        {Side_Back},
        Layer_Middle,
        Cube_Top_Right,
        {Side_Top}
    },
    {
        Layer_Front,
        Cube_Top,
        {Side_Front, Side_Top},
        Layer_Front,
        Cube_Bottom,
        {Side_Bottom, Side_Front}
    },
    {
        Layer_Front,
        Cube_Bottom,
        {Side_Front, Side_Bottom},
        Layer_Back,
        Cube_Bottom,
        {Side_Bottom, Side_Back}
    },
    {
        Layer_Back,
        Cube_Top,
        {Side_Top, Side_Back},
        Layer_Front,
        Cube_Top,
        {Side_Front, Side_Top}
    },
    {
        Layer_Back,
        Cube_Bottom,
        {Side_Back, Side_Bottom},
        Layer_Back,
        Cube_Top,
        {Side_Top, Side_Back}
    }
};

__constant__ const  MoveWithLayer rotateFaceColorsXUpCenterMoves[6] = {
    {
        Layer_Front,
        Cube_Center,
        {Side_Front},
        Layer_Middle,
        Cube_Bottom,
        {Side_Bottom}
    },
    {
        Layer_Middle,
        Cube_Top,
        {Side_Top},
        Layer_Front,
        Cube_Center,
        {Side_Front}
    },
    {
        Layer_Middle,
        Cube_Bottom,
        {Side_Bottom},
        Layer_Back,
        Cube_Center,
        {Side_Back}
    },
    {
        Layer_Back,
        Cube_Center,
        {Side_Back},
        Layer_Middle,
        Cube_Top,
        {Side_Top}
    },
    {
        Layer_Middle,
        Cube_Left,
        {Side_Left},
        Layer_Middle,
        Cube_Left,
        {Side_Left}
    },
    {
        Layer_Middle,
        Cube_Right,
        {Side_Right},
        Layer_Middle,
        Cube_Right,
        {Side_Right}
    }
};

__constant__ const  MoveWithLayer rotateFaceColorsXDownCornerMoves[8] = {
    {
        Layer_Front,
        Cube_Top_Left,
        {Side_Front, Side_Top},
        Layer_Back,
        Cube_Top_Left,
        {Side_Top, Side_Back}
    },
    {
        Layer_Front,
        Cube_Top_Right,
        {Side_Front, Side_Top},
        Layer_Back,
        Cube_Top_Right,
        {Side_Top, Side_Back}
    },
    {
        Layer_Front,
        Cube_Bottom_Left,
        {Side_Front, Side_Bottom},
        Layer_Front,
        Cube_Top_Left,
        {Side_Top, Side_Front}
    },
    {
        Layer_Front,
        Cube_Bottom_Right,
        {Side_Front, Side_Bottom},
        Layer_Front,
        Cube_Top_Right,
        {Side_Top, Side_Front}
    },
    {
        Layer_Back,
        Cube_Top_Left,
        {Side_Top, Side_Back},
        Layer_Back,
        Cube_Bottom_Left,
        {Side_Back, Side_Bottom}
    },
    {
        Layer_Back,
        Cube_Top_Right,
        {Side_Top, Side_Back},
        Layer_Back,
        Cube_Bottom_Right,
        {Side_Back, Side_Bottom}
    },
    {
        Layer_Back,
        Cube_Bottom_Left,
        {Side_Back, Side_Bottom},
        Layer_Front,
        Cube_Bottom_Left,
        {Side_Bottom, Side_Front}
    },
    {
        Layer_Back,
        Cube_Bottom_Right,
        {Side_Back, Side_Bottom},
        Layer_Front,
        Cube_Bottom_Right,
        {Side_Bottom, Side_Front}
    }
};

__constant__ const  MoveWithLayer rotateFaceColorsXDownEdgeMoves[12] = {
    {
        Layer_Front,
        Cube_Left,
        {Side_Front},
        Layer_Middle,
        Cube_Top_Left,
        {Side_Top}
    },
    {
        Layer_Front,
        Cube_Right,
        {Side_Front},
        Layer_Middle,
        Cube_Top_Right,
        {Side_Top}
    },
    {
        Layer_Middle,
        Cube_Top_Left,
        {Side_Top},
        Layer_Back,
        Cube_Left,
        {Side_Back}
    },
    {
        Layer_Middle,
        Cube_Top_Right,
        {Side_Top},
        Layer_Back,
        Cube_Right,
        {Side_Back}
    },
    {
        Layer_Middle,
        Cube_Bottom_Left,
        {Side_Bottom},
        Layer_Front,
        Cube_Left,
        {Side_Front}
    },
    {
        Layer_Middle,
        Cube_Bottom_Right,
        {Side_Bottom},
        Layer_Front,
        Cube_Right,
        {Side_Front}
    },
    {
        Layer_Back,
        Cube_Left,
        {Side_Back},
        Layer_Middle,
        Cube_Bottom_Left,
        {Side_Bottom}
    },
    {
        Layer_Back,
        Cube_Right,
        {Side_Back},
        Layer_Middle,
        Cube_Bottom_Right,
        {Side_Bottom}
    },
    {
        Layer_Front,
        Cube_Top,
        {Side_Front, Side_Top},
        Layer_Back,
        Cube_Top,
        {Side_Top, Side_Back}
    },
    {
        Layer_Front,
        Cube_Bottom,
        {Side_Front, Side_Bottom},
        Layer_Front,
        Cube_Top,
        {Side_Top, Side_Front}
    },
    {
        Layer_Back,
        Cube_Top,
        {Side_Top, Side_Back},
        Layer_Back,
        Cube_Bottom,
        {Side_Back, Side_Bottom}
    },
    {
        Layer_Back,
        Cube_Bottom,
        {Side_Back, Side_Bottom},
        Layer_Front,
        Cube_Bottom,
        {Side_Bottom, Side_Front}
    }
};

__constant__ const  MoveWithLayer rotateFaceColorsXDownCenterMoves[6] = {
    {
        Layer_Front,
        Cube_Center,
        {Side_Front},
        Layer_Middle,
        Cube_Top,
        {Side_Top}
    },
    {
        Layer_Middle,
        Cube_Top,
        {Side_Top},
        Layer_Back,
        Cube_Center,
        {Side_Back}
    },
    {
        Layer_Middle,
        Cube_Bottom,
        {Side_Bottom},
        Layer_Front,
        Cube_Center,
        {Side_Front}
    },
    {
        Layer_Back,
        Cube_Center,
        {Side_Back},
        Layer_Middle,
        Cube_Bottom,
        {Side_Bottom}
    },
    {
        Layer_Middle,
        Cube_Left,
        {Side_Left},
        Layer_Middle,
        Cube_Left,
        {Side_Left}
    },
    {
        Layer_Middle,
        Cube_Right,
        {Side_Right},
        Layer_Middle,
        Cube_Right,
        {Side_Right}
    }
};