#pragma once

typedef enum Side_t
{
    Side_Right,
    Side_Left,
    Side_Top,
    Side_Bottom,
    Side_Front,
    Side_Back
} Side;

typedef enum Orientation_e
{
    X,
    Y,
    Z
} Orientation;

typedef enum CubeLayer_e
{
    CubeLayer_Front,
    CubeLayer_S,
    CubeLayer_Back,
    CubeLayer_Left,
    CubeLayer_M,
    CubeLayer_Right,
    CubeLayer_Top,
    CubeLayer_E,
    CubeLayer_Bottom
} CubeLayer;

typedef enum Direction_e
{
    Direction_Right,
    Direction_Left,
    Direction_Down,
    Direction_Up,
    Direction_Tilt_Right,
    Direction_Tilt_Left
} Direction;

typedef enum Cube_e
{
    Cube_Top_Left,
    Cube_Top,
    Cube_Top_Right,
    Cube_Left,
    Cube_Center,
    Cube_Right,
    Cube_Bottom_Left,
    Cube_Bottom,
    Cube_Bottom_Right
} Cube;

typedef enum Layer_e
{
    Layer_Front,
    Layer_Middle,
    Layer_Back
} Layer;

typedef enum Color_e
{
    Black,
    White,
    Red,
    Green,
    Blue,
    Yellow,
    Orange
} Color;

typedef enum MoveIdx_e
{
    MoveIdx_Y_Right,
    MoveIdx_Y_Left,
    MoveIdx_X_Down,
    MoveIdx_X_Up,
    MoveIdx_Z_Right,
    MoveIdx_Z_Left,
    MoveIdx_None
} MoveIdx;

typedef enum Notation_e
{
    None,
    L, Lp, L2,
    R, Rp, R2,
    F, Fp, F2,
    B, Bp, B2,
    U, Up, U2,
    D, Dp, D2,
    M, Mp, M2,
    E, Ep, E2,
    S, Sp, S2,
    x, xp, x2,
    y, yp, y2,
    z, zp, z2
} Notation;