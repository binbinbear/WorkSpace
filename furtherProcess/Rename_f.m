function Rename_f(homepath,dhomepath,scenario)
%�ļ�������ת������ʱ��˳��ԭ����ʱ���������ļ���������Ϊ�����ļ�����������������
%������ʽ��CC��CC1.mat
%������ʽ��IQ��IQ1.mat
% homepath='F:\library\paper\dataProcess\rawdata\';%��Ŀ¼
% dhomepath='F:\library\paper\dataProcess\';%��Ŀ¼
% scenario='inLOS_1Person';%��ʱ���洢�ļ��е����� need to be changed
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