function automatingNovelFeat(subnum, run)

    infile= ('design.fsf'); % this loads in the fsf file (ours will be design.fsf
    outfile= ( 'newdesign.fsf'); % this makes the output file
    fin=fopen(infile,'r'); % opens the file (not load) and assigns the ID to fin
    fout=fopen(outfile,'w+'); % opens the output file and assigns the ID to fout  This stays empty until we fill it with the new fsf file at the end

    while ~feof(fin)
        s=fgetl(fin);
        % strrep actuall replaces a value from a string to another value
        
        %% we need to change the output file, the input file, the anatomical, and the 5 ptr sheets
      
          s=strrep(s,['Novel' num2str(run-1)], ['Novel' num2str(run)]); % change output folder 

    
        s=strrep(s,['novel_run-' num2str(run-1)], ['novel_run-' num2str(run)]); % change the functional run input
        
         
        s=strrep(s,['sub-0' num2str(subnum-1) '/anat/' 'sub-0' num2str(subnum-1)],['sub-0' num2str(subnum) '/anat/' 'sub-0' num2str(subnum)]); % change anatomical scan but only every 5 while loops
        
        
             s=strrep(s,['novel_ptr_run' num2str(run-1)],['novel_ptr_run' num2str(run)]); %% intact. S4, S16, S64, S256 PTR sheet


        fprintf(fout,'%s\n',s);  % this writes the new design file to the empty fout file we made earlier. 
    end

    fclose(fin);
    fclose(fout);
    
     command = (['/usr/local/fsl/bin/feat ' outfile]);
     [status,cmdout] = system(command);
   
   
   
    end
