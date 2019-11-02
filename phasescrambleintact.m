function  phasescrambleintact()
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
basename = 'SHINEd_obj%d.tif';



    for imageno = [1:160]
       
        filename = sprintf(basename,imageno);
        
        objectimage = imread(filename);
        
       objectimage = imscramble(objectimage);
       
        outfilename = sprintf('Phasescrambledintact\\S1_SHINEd_obj%d_phasescram.tif', imageno);
        
        imwrite(objectimage, outfilename, 'TIFF');
        
    end

end

