function GetPDP_f(homepath,scenario)
file_dir=[homepath scenario '\'];
dhomepath=fullfile('F:\library\paper\dataProcess\CCresult\');
dfolderpath=[dhomepath scenario '\'];
file_CC=dir(fullfile(file_dir,'CC*.mat'));
file_config=dir(fullfile(file_dir,'config*.mat'))
compen_dB=zeros(1,100);
[TotalFileNum,~]=size(file_CC);
if TotalFileNum~=0
    if exist(dfolderpath,'dir')==0
        mkdir(dfolderpath);
    end
%     load(file_config);
    for file_num=1:TotalFileNum
        GetDelay_ff([file_dir file_CC(file_num).name],[dfolderpath 'PDP' file_CC(file_num).name(end-5:end-4)],compen_dB(file_num));
    end
    
end


    
