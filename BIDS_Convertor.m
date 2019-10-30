function BIDS_Convertor_Weber(input,sub_number)
%the function converts functional and anatomical scans to BIDS format.
% it is based on the dicm2nii function. 
%input --> folder with the raw data
%(e.g., /Users/erezfreud/Box_Sync/Weber/91021032_001_91021032_001/FREUD_WEBER_20190123_152214_213000)
%sub_number --> number - (e.g., 01 , 02 ...10,11) as a string

BIDS_Folder='/Users/andreja/Documents/MATLAB/projects/fMRI_Shape_sensitivity/BIDS/';

mkdir([BIDS_Folder 'sub-' sub_number])
mkdir([BIDS_Folder 'sub-' sub_number '/anat'])
mkdir([BIDS_Folder '/sub-' sub_number '/func'])
a=1;b=1;

anatomy_output=[BIDS_Folder 'sub-' sub_number '/anat/'];
functional_output=[BIDS_Folder '/sub-' sub_number '/func/'];
temp_folder=[BIDS_Folder '/sub-' sub_number '/temp/'];
% Get a list of all files and folders in this folder.
files = dir(input);
    for i=5:length(files)
        if strcmp(files(i).name(1:2),'T1') %detect anatomy scan- Folder name strats with T1
            dicm2nii([files(i).folder '/' files(i).name '/'],[files(i).folder '/' files(i).name '/'] ,5)
            temp=dir([files(i).folder '/' files(i).name '/*.json']);
            command = (['mv ' temp.folder '/' temp.name ' ' anatomy_output 'sub-' sub_number '_T1w.json'])%change files name using the commandline (mac)
            [status,cmdout] = system(command);

            temp=dir([files(i).folder '/' files(i).name '/*.nii.gz']);
            command = (['mv ' temp.folder '/' temp.name ' ' anatomy_output 'sub-' sub_number '_T1w.nii.gz'])%change files name using the commandline (mac)
            [status,cmdout] = system(command);
        else  
            dicm2nii([files(i).folder '/' files(i).name '/'],[files(i).folder '/' files(i).name '/'] ,1) %functional scan
            temp=dir([files(i).folder '/' files(i).name '/*.json']);
            temp2=dir([files(i).folder '/' files(i).name '/*.nii.gz']);
            
            tempdir=dir([files(i).folder '/' files(i).name '/*IMA']);
            hdr=spm_dicom_headers([tempdir(1).folder '/' tempdir(i).name]);
            timing=hdr{1,1}.Private_0019_1029';
            
            %detect experimental runs - Novel 
                    if strfind(files(i).name,'NOVEL')>0
                       taskname=['novel_run-' num2str(a) '_bold'];
                       a=a+1;
                    else
                       taskname=['semantic_run-' num2str(b) '_bold'];
                       b=b+1;
                    end
                    
            command = (['mv ' temp.folder '/' temp.name ' ' functional_output 'sub-' sub_number '_task-' taskname '.json']);%change files name using the commandline (mac)
            [status,cmdout] = system(command);

            command = (['mv ' temp2.folder '/' temp2.name ' ' functional_output 'sub-' sub_number '_task-' taskname '.nii.gz']);%change files name using the commandline (mac)
            [status,cmdout] = system(command); 
            TR=1500;    
            timing_TR=real(timing/TR-1);
            save([functional_output 'sub-' sub_number '_task-' taskname '_slicetiming.txt'], 'timing_TR', '-ASCII','-append')

        end
    end

end



