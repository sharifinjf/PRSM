clc

clear
close all

Dir=dir;

cutNumberString='null';

Images=cell(10,1);
RectanglesForInterp=cell(10,2);
FlagHolding=0; % 1 for holding the images for 
CounterInterpImages=0;

%img=GP018377_cut____f0640;
for i=3:length(Dir)
    filename=Dir(i).name;
    if strcmp(filename(end-2:end),'jpg')
        
%         cutNumber=
        a=strfind(filename,'-');
        b=strfind(filename,'_');
        cutNumberStringNew=filename(a(end)+1:b-1);
        
        if strcmp(cutNumberString,cutNumberStringNew)
        % initialization    
        else
            cutNumberString=cutNumberStringNew;
            clear Images RectanglesInterp RectanglesPre RectanglesCur;
            Images=cell(10,1);
%             RectanglesPre;
%             RectanglesCur;
            RectanglesForInterp=cell(10,2);
        end
        
        
        img=imread(filename);
                
        Th_intensity=200;
        Th_Scale_1=50;
        Th_Scale_2=50;
        
        MaskRed=zeros(size(img));
        MaskRed(img(:,:,1)>Th_intensity & ...
        img(:,:,1)./img(:,:,2)>Th_Scale_1 & ...
        img(:,:,1)./img(:,:,3)>Th_Scale_2 )=1;
        imshow(MaskRed,[]);
        
        BinaryMask=MaskRed(:,:,1);
        [BwLabled,num]=bwlabel(BinaryMask);
        BwThin=bwmorph(BinaryMask,'thin',Inf);
        Areas=regionprops(BwThin,'area');
        
        % condition for challenges image should be add
        
        % filter objects by area
        for j=1:length(Areas)
            if Areas(j).Area<100
              BwThin(BwLabled==j)=0;  
            end
        end
           
        
        if BwThin==0
            if FlagHolding==1
            CounterInterpImages=CounterInterpImages+1;
            Images{CounterInterpImages}=img;
            else
                
            end
            
        else
            
            BoundigBoxes=regionprops(BwThin,'BoundingBox');
            
            if FlagHolding==0
                FlagHolding=1;
                RectanglesPre=BoundigBoxes;
            else
                FlagHolding=1;
                RectanglesCurrent=BoundigBoxes;
                CounterInterpImages=0;
                
                % estiamate corresponding rectangles
                
                for k=1:length(RectanglesCurrent)
                   for l=1:length(RectanglesPre)
                        dist(k,l) = norm( RectanglesCurrent(k).BoundingBox(1:4) ...
                        - RectanglesPre(l).BoundingBox(1:4) );
                   end
                   
                   if min(dist(k,:))<100
                   
                       
                       
                   end
                   
                end
                
                
                
                
                % interp
                
                
            end
        end
        
        
        
    end
end


%% 
