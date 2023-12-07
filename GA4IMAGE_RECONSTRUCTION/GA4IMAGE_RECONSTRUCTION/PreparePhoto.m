% Written by Dr. Seyedali Mirjalili
% To watch videos on this algorithm, enrol to my courses with 95% discount using the following links: 

% ************************************************************************************************************************************************* 
%  A course on "Optimization Problems and Algorithms: how to understand, formulation, and solve optimization problems": 
%  https://www.udemy.com/optimisation/?couponCode=MATHWORKSREF
% ************************************************************************************************************************************************* 
%  "Introduction to Genetic Algorithms: Theory and Applications" 
%  https://www.udemy.com/geneticalgorithm/?couponCode=MATHWORKSREF
% ************************************************************************************************************************************************* 

function [ IMG_REF_BINARY ] = PreparePhoto(fileName)

IMG_REF = imread(fileName,'jpg');

for i = 1 : size(IMG_REF,1)
    for j = 1 : size(IMG_REF,2)
        if IMG_REF(i,j,2) <= 255 &&  IMG_REF(i,j,2) > 200
            IMG_REF_BINARY(i,j) = 255;
        else
            IMG_REF_BINARY(i,j) = 0 ;
        end
    end
end

imshow(IMG_REF_BINARY)
save IMG_REF_BINARY IMG_REF_BINARY

end