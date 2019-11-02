function  phasescramble()
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
basename = 'S%d_SHINEd_obj%d.tif';


for group = [4,16,64,256]
    
    %basefilename = basenames{group+1};

    for imageno = [1:160]
       
        filename = sprintf(basename,group,imageno);
        
        objectimage = imread(filename);
        
       objectimage = imscramble(objectimage);
       
        outfilename = sprintf('Phasescrambled\\S%d_SHINEd_obj%d_phasescram.tif', group, imageno);
        
        imwrite(objectimage, outfilename, 'TIFF');
        
    end

end

end

