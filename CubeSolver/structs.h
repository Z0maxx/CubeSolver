#pragma once

#include "enums.h"

typedef struct Move_s
{
	Layer targetLayer;
	Cube targetCube;
	Side targetSides[2];
	Layer originLayer;
	Cube originCube;
	Side originSides[2];
} Move;

typedef struct CubeAlwaysMove_s
{
	Layer layer;
	Cube cube;
} CubeAlwaysMove;

typedef struct Reference_s
{
	Layer layer;
	Cube cube;
	Side side;
} Reference;

typedef struct NearReference_s
{
	Reference origin;
	Reference leftTarget;
	Reference rightTarget;
} NearReference;

typedef struct CubeReference_s
{
	Layer layer;
	Cube cube;
} CubeReference;

typedef struct Edge_s
{
	Layer layer;
	Cube cube;
	Side sides[2];
} Edge;

typedef struct EdgeSolveSequence_s
{
	Layer layer;
	Cube cube;
	Side side;
	Notation sequence[16];
} EdgeSolveSequence;

typedef struct Corner_s
{
	Layer layer;
	Cube cube;
	Side sides[3];
} Corner;

typedef struct CornerSolveSequence_s
{
	Layer layer;
	Cube cube;
	Side side;
	Notation sequence[8];
} CornerSolveSequence;

typedef struct MatchSequence_s
{
	bool match[4];
	Notation sequence[9];
} MatchSequence;

typedef struct MatchNearSequence_s
{
	bool match[4];
	Notation sequence[17];
	bool near[4];
} MatchNearSequence;

typedef struct TranslatedNotation_s
{
	bool layer;
	bool twice;
	Direction direction;
	CubeLayer cubeLayer;
} TranslatedNotation;

typedef struct LayerTurnAngle_s
{
	CubeLayer cubeLayer;
	Direction direction;
	int angle;
} LayerTurnAngle;

typedef struct SolveRotation_s
{
	int rotation;
	int newRotation;
	bool twice;
	Direction direction;
	Notation notation;
} SolveRotation;

typedef struct SolvePiece_s
{
	SolveRotation solveRotations[3];
} SolvePiece;