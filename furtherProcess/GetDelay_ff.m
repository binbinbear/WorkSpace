function GetDelay_ff(filename,dfilename,compen_dB) 
%===========================================================================
cycnum=1000;
codelength=511;
samplingrate=3; % 3times sampling
chiprate=400;% MHz
drthreshold=15;%dB
cut=7;
factor=1000/50/1533^2;
%===========================================================================
%===========================================================================
load(filename)
n=size(CC,1);
m=size(CC,2);
pdp=zeros(n,m/2-1);
for ii=1:(m/2-1)
    pdp(:,ii)=CC(:,ii*2+1).^2+CC(:,ii*2+2).^2;
end
resolution=1./(chiprate*samplingrate)*10^3;% ns
sampoint=codelength*samplingrate;
spdp=zeros(1,sampoint);
PDP=zeros(cycnum,sampoint);
aPDP=zeros(1,sampoint);
for j=1:cycnum
    maxindex=find(pdp(j,:)==max(pdp(j,1800:4200)));
    sindex=maxindex-300;
    eindex=sindex+sampoint-1;
    PDP(j,:)=pdp(j,sindex:eindex);
    PDP(j,:)=10*log10(PDP(j,:).*factor)+compen_dB;
    aPDP=aPDP+PDP(j,:);
end
aPDP=aPDP/cycnum;
plot(aPDP);
save(dfilename,'PDP','aPDP');
saveas(gcf,[dfilename '.jpg']);