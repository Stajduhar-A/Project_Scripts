% set FSL environment
clear all
%locations=readtable('/Users/efreud/Documents/ROIdef_try/ROI_Locations.csv')
setenv('FSLDIR','/usr/local/fsl');  % this to tell where FSL folder is
setenv('FSLOUTPUTTYPE', 'NIFTI_GZ'); % this to tell what the output type would be
%cmd = '/usr/local/fsl/bin/fslmaths MNI152_T1_2mm_brain.nii.gz -roi  42 14 14 5 26 8 0 1 clusternew1';
%system(cmd);
%cmd = '/usr/local/fsl/bin/fslmaths MNI152_T1_2mm_brain.nii.gz -roi  ROIX XL ROIY YL ROIZ ZL 0 1 clusternew';
 
for i=1:100
   %temp=table2array(locations(i,1:6));
   %command=(['/usr/local/fsl/bin/fslmaths /usr/local/fsl/data/standard/MNI152_T1_2mm_brain.nii.gz -roi ' num2str(temp) ' 0 1 /Users/mrisoftware/Desktop/ROIs/cluster' num2str(i)]);    
   %[status,cmdout] = system(command);
   command=(['/usr/local/fsl/bin/fslmaths /Users/andrejastajduhar/Documents/MATLAB/projects/fMRI_Shape_sensitivity/ROIs_practice/Bin_ROI/Sub-01ROI/cluster' num2str(i) '_bin_func ' '-thr 0.00001 -bin /Users/andrejastajduhar/Documents/ROIdef_try_bin_sub01/cluster' num2str(i) '_bin_func']);    
   [status,cmdout] = system(command);
    
end