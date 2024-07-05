%% IN THE NAME OF ALLAH
% % clc;clear; close all;
% % Dir=dir;
% for i=3:length(Dir)
% %     filename=Dir(5).name;
% %     img=imread(filename);
function [BoundigBoxes,Number_Bundig] = BOUNDING_BOXES(img)
    Th_intensity  = 200;
    Th_Scale_1    = 50;
    Th_Scale_2    = 50;
    
    MaskRed=zeros(size(img));
    MaskRed(img(:,:,1)>Th_intensity & ...
        img(:,:,1)./img(:,:,2)>Th_Scale_1 & ...
        img(:,:,1)./img(:,:,3)>Th_Scale_2 )=1;
    
    BinaryMask    = MaskRed(:,:,1);
    [BwLabled,num]= bwlabel(BinaryMask);
    BwThin = bwmorph(BinaryMask,'thin',Inf);
    Areas  =  regionprops(BwThin,'area');
    
    % condition for challenges image should be add
    
    % filter objects by area
    for j = 1:length(Areas)
        if Areas(j).Area<100
            BwThin(BwLabled==j)=0;
        end
    end
    BoundigBoxes = regionprops(BwThin,'BoundingBox');
    [Number_Bundig,~] = size( BoundigBoxes);
end
% %     aa =  BoundigBoxes(1,1).BoundingBox;
% %     regin_imag = img (aa(1,2):aa(1,2)+aa(1,4),aa(1,1):aa(1,1)+aa(1,3));
% %     figure 
% %     imshow(img)
% %     figure
% %     imshow(regin_imag)

   
