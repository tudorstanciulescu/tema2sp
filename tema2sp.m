syms t;
p=40;
nr=19;
N=50;
w0=(2*pi)/p;
t1=0:0.2:80;
x=1;
x1=0.5*square(t1*2*pi*1/p,(19*100)/40);
X0=int(x,t,0,nr);
disp('X0=');
disp(X0);
a=zeros(1,N);
freq=zeros(1,N);
y=0;
for k=1:N;
    f=x*exp(-1j*w0*k*t);
    Xk=int(f,t,0,nr);
    a(k)=sqrt((imag(Xk))^2+(real(Xk))^2);
    freq(k)=k/p;
    S=['X', num2str(k),'='];
    disp(S);
    disp(Xk);
    y=y+2*1/p*(Xk*exp(1j*k*w0*t1));
end
y1=y+1/p*X0;
figure(1)
stem(0,X0,'-b')
hold on
stem(-freq,a,'-b')
hold on
stem(freq,a,'-b')
hold off
title('Spectrul de aplitudini')
xlim([-N/p N/p])
figure(2)
plot(t1,x1+0.5)
hold on
plot(t1,y1)
axis([0 80 -2 2])
title('Semnalul  initial si a celui recontruit')
legend('semnalul initial','semnalul reconstrui')
