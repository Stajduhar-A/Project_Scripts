% set FSL environment
clear all
locations=readtable('/Users/efreud/Documents/ROIdef_try/ROI_Locations.csv')
setenv('FSLDIR','/usr/local/fsl');  % this to tell where FSL folder is
setenv('FSLOUTPUTTYPE', 'NIFTI_GZ'); % this to tell what the output type would be
cmd = '/usr/local/fsl/bin/fslmaths MNI152_T1_2mm_brain.nii.gz -roi  42 14 14 5 26 8 0 1 clusternew1'; %comment this out when running for loop below
system(cmd);
cmd = '/usr/local/fsl/bin/fslmaths MNI152_T1_2mm_brain.nii.gz -roi  ROIX XL ROIY YL ROIZ ZL 0 1 clusternew'; %comment this out when running for loop below
 
for i=1:100
   temp=table2array(locations(i,1:6));
   command=(['/usr/local/fsl/bin/fslmaths /usr/local/fsl/data/standard/MNI152_T1_2mm_brain.nii.gz -roi ' num2str(temp) ' 0 1 /Users/efreud/Documents/ROIdef_try/clusternew' num2str(i)]);    
   [status,cmdout] = system(command);
    
end
