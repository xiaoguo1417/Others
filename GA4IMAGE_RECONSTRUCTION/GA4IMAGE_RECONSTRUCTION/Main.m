% Written by Dr. Seyedali Mirjalili
% To watch videos on this algorithm, enrol to my courses with 95% discount using the following links: 

% ************************************************************************************************************************************************* 
%  A course on "Optimization Problems and Algorithms: how to understand, formulation, and solve optimization problems": 
%  https://www.udemy.com/optimisation/?couponCode=MATHWORKSREF
% ************************************************************************************************************************************************* 
%  "Introduction to Genetic Algorithms: Theory and Applications" 
%  https://www.udemy.com/geneticalgorithm/?couponCode=MATHWORKSREF
% ************************************************************************************************************************************************* 

% main 

clear
clc
close all

fileName = 'IMG1.jpg'
IMG_REF_BINARY = PreparePhoto(fileName);%二值化

%% controling paramters of the GA algortihm
Problem.obj = @FitnessFunction;
Problem.nVar =  size(IMG_REF_BINARY,1) *  size(IMG_REF_BINARY,2);%矩阵的行数和列数

M = 30; % number of chromosomes (cadinate solutions)
N = Problem.nVar;  % number of genes (variables)
MaxGen = 1000;
Pc = 0.95;
Pm = 0.001;
Er = 0.2;

visualization = 1; % set to 0 if you do not want the convergence curve 

figure
subplot(1,2,1)
imshow(IMG_REF_BINARY)
title('Original image')

[BestChrom]  = GeneticAlgorithm (M , N, MaxGen , Pc, Pm , Er , Problem.obj , visualization )

disp('The best chromosome found: ')
BestChrom.Gene
disp('The best fitness value: ')
BestChrom.Fitness