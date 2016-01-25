close;
clear;
clc;
dir_home='F:\library\paper\dataProcess\rawdata\';%主目录
dhomepath='F:\library\paper\dataProcess\'%目标上层目录
dir_name=dir(dir_home);
[TotalNum,~]=size(dir_name);
for index=1:TotalNum
    if(dir_name(index).isdir==1)
            Rename_f(dir_home,dhomepath,dir_name(index).name)
    end
end