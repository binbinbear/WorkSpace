function Rename_f(homepath,dhomepath,scenario)
%文件名批量转换，按时间顺序将原来以时间命名的文件，重命名为规律文件名，便于批量处理。
%命名格式：CC：CC1.mat
%命名格式：IQ：IQ1.mat
% homepath='F:\library\paper\dataProcess\rawdata\';%主目录
% dhomepath='F:\library\paper\dataProcess\';%主目录
% scenario='inLOS_1Person';%量时所存储文件夹的名称 need to be changed
full_file_dir=[homepath scenario '/'];
CC_out_file=[dhomepath 'CCdata/' scenario '/'];
if exist(CC_out_file,'dir')==0
    mkdir(CC_out_file);
end
IQ_out_file=[dhomepath 'IQdata/' scenario '/'];
if exist(IQ_out_file,'dir')==0
    mkdir(IQ_out_file);
end
file_name_CC=dir(fullfile(full_file_dir,'CC*.mat'));
file_name_IQ=dir(fullfile(full_file_dir,'IQ*.mat'));
[TotalFileNum,~]=size(file_name_CC);
for file_num=1:TotalFileNum
    copyfile([full_file_dir file_name_CC(file_num).name],[CC_out_file file_name_CC(file_num).name]);
    copyfile([full_file_dir file_name_IQ(file_num).name],[IQ_out_file file_name_IQ(file_num).name]);
end