% DS(KS, SR)
[KS, SR] = meshgrid(0:1/20:1);
DS = (1 - KS) .* (1 - SR);
surf(KS, SR, DS);
xlabel('KS')
ylabel('SR')
zlabel('DS')
view([-36.81 20.44])

%DStx(DSn, DSor)
[DSn, DSOr] = meshgrid(0:1/20:1);
DStx = (1 - DSn) .* DSOr;
surf(DSn, DSOr, DStx);
xlabel('DSn')
ylabel('DSOr')
zlabel('DStx')
view([-121.61 19.42])

%CPt
[DSt, DStm1] = meshgrid(0:1/20:1);
CPt = (DSt - DStm1) ./ DStm1;
surf(DSt, DStm1, CPt);
xlabel('DS(t)')
ylabel('DS(t-1)')
zlabel('CP(t)')
view([-141.7 22.7])
