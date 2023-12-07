% Written by Dr. Seyedali Mirjalili
% To watch videos on this algorithm, enrol to my courses with 95% discount using the following links: 

% ************************************************************************************************************************************************* 
%  A course on "Optimization Problems and Algorithms: how to understand, formulation, and solve optimization problems": 
%  https://www.udemy.com/optimisation/?couponCode=MATHWORKSREF
% ************************************************************************************************************************************************* 
%  "Introduction to Genetic Algorithms: Theory and Applications" 
%  https://www.udemy.com/geneticalgorithm/?couponCode=MATHWORKSREF
% ************************************************************************************************************************************************* 

function [error] = FitnessFunction (X  , IMG_REF_BINARY)

col_no = size(IMG_REF_BINARY,2);
Recons_IMG = vec2mat(X , col_no);

Recons_IMG = Recons_IMG .* 255;


error =-1 * sum( sum ( abs(Recons_IMG - IMG_REF_BINARY) ) );


end