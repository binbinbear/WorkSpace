close;
clear;
clc;
dir_home='F:\library\paper\dataProcess\CCdata\';%��Ŀ¼
dir_name=dir(dir_home);
[TotalNum,~]=size(dir_name);
for index=1:TotalNum
    if(dir_name(index).isdir==1)
            GetPDP_f(dir_home,dir_name(index).name)
    end
end