# The code solves the 2d diffusion equation for a irregular shaped object using Finite Volume Method

# List of files

## 1. distmesh.m
###   This is a Mesh generating code developed by  Per-Olof Persson
###   The distmesh generates triangular meshes for the set of points provided  

## 2. CheckTetMesh.m
###   creates set of points, and invokes the distmesh

## 2. meshgen.m
###   generate mesh from the set of points using distmesh

## 3. connctivity.m 
###    Creates coordinates for cell centers, face center and cell vertices

## 4. p2t.m
###   Interpolates from cell vertices to cell centroid

## 5. t2p.m
###   Interpolates between cell centroids and vertices

## 6. ImplicitEulerFVM.m
###   Contains code to solve the 2d diffusion equation using Finite volume based-implict euler method






