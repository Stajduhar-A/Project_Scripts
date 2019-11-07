% set FSL environment
clear all
%locations=readtable('/Users/andrejastajduhar/Documents/MATLAB/projects/fMRI_Shape_sensitivity/ROI_Locations.csv')
%locations=dir('/Users/andrejastajduhar/Documents/ROIdef_try'); 
setenv('FSLDIR','/usr/local/fsl');  % this to tell where FSL folder is
setenv('FSLOUTPUTTYPE', 'NIFTI_GZ'); % this to tell what the output type would be
%cmd = '/usr/local/fsl/bin/fslmaths MNI152_T1_2mm_brain.nii.gz -roi  42 14 14 5 26 8 0 1 clusternew1'; %comment this out when running for loop below
%system(cmd);
%cmd = '/usr/local/fsl/bin/fslmaths MNI152_T1_2mm_brain.nii.gz -roi  ROIX XL ROIY YL ROIZ ZL 0 1 clusternew'; %comment this out when running for loop below
 
for i=1:100
   %temp=table2array(locations(i,1:6));
   %command=(['/usr/local/fsl/bin/fslmaths /usr/local/fsl/data/standard/MNI152_T1_2mm_brain.nii.gz -roi ' num2str(temp) ' 0 1 /Users/andrejastajduhar/Documents/ROIdef_try/clusternew' num2str(i)]); 
   command=(['/usr/local/fsl/bin/fslmaths /Users/andrejastajduhar/Documents/ROIdef_try/clusternew' num2str(i) ' -thr 0.00001 -bin /Users/andrejastajduhar/Documents/ROIdef_try_bin/clusternew' num2str(i) '_bin']);
   [status,cmdout] = system(command);
    
end
 
