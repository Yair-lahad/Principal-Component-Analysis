function freqVec=getFreqOrder(f)
%function input- frequency vector
%function output- cell with organized frequency bands

%setting bandpass
delta= [1 4.5];
theta =[4.5 8];
lowAlpha=[ 8 11.5];
highAlpha =[11.5 15];
beta= [15 30];
gamma= [30 40];
%calculations 
delta_f= f>=delta(1) & f<=delta(2);
theta_f= f>=theta(1) & f<=theta(2);
lowAlpha_f= f>=lowAlpha(1) & f<=lowAlpha(2);
highAlpha_f= f>=highAlpha(1) & f<=highAlpha(2);
beta_f=f>=beta(1) & f<=beta(2);
gamma_f=f>=gamma(1) & f<=gamma(2);
%adding all bands to a cell
freqVec={delta_f,theta_f, lowAlpha_f, highAlpha_f, beta_f, gamma_f};
end