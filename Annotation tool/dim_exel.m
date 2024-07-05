%% IN THE NAME OF ALLAH
 function [Number_row] = dim_exel()
[~, ~, tagimage] = xlsread('tag_image.xlsx','Sheet1');
tagimage(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),tagimage)) = {''};
[Number_row,~]        = size(tagimage);
 end
