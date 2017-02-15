%Moodulacion ASK Y FSK 

x=[1 0 1 0 0 1 1 0 1]; %Secuencia Binaria
bp=0.001;% tiempo de bit (ms)

%dibuja la secuencia binaria como señal digital%
bit=[]; 
for n=1:1:length(x)
    if x(n)==1;
       arreglo=ones(1,100);
    else x(n)==0;
        arreglo=zeros(1,100);
    end
     bit=[bit arreglo];
end
t1=bp/100:bp/100:100*length(x)*(bp/100);
subplot(3,1,1);
plot(t1,bit,'lineWidth',2.5);grid on;
axis([ 0 bp*length(x) -.5 1.5]);
xlabel('tiempo(seg)');
ylabel('amplitud(V)');
title('Secuencia como señal digital');

%ModulacionASK%
%%2 niveles de voltaje
A1=10; % Amplitud de la señal portadora para 1
A2=5;  % Amplitud de la señal portadora para 0
br=1/bp; % velocidad de bit
f=br*5; % frecuencia de la portadora
t2=bp/99:bp/99:bp;                 
%ss=length(t2);
m=[];
for (i=1:1:length(x))
    if (x(i)==1)
        y=A1*cos(2*pi*f*t2);
    else
        y=A2*cos(2*pi*f*t2);
    end
    m=[m y];
end
t3=bp/99:bp/99:bp*length(x);
subplot(3,1,2);
plot(t3,m);
xlabel('tiempo(seg)');
ylabel('amplitud(V)');
title('Modulación ASK');

%ModulacionFSK%
%%2 niveles de voltaje
A=5;  % Amplitud de la señal portadora
br=1/bp; % velocidad de bit
f1=br*6; % frecuencia de la portadora 1
f2=br*3; % frecuencia de la portadora 2
t4=bp/99:bp/99:bp;                 
%ss1=length(t4);
n=[];
for (j=1:1:length(x))
    if (x(j)==1)
        y=A*cos(2*pi*f1*t4);
    else
        y=A*cos(2*pi*f2*t4);
    end
    n=[n y];
end
t5=bp/99:bp/99:bp*length(x);
subplot(3,1,3);
plot(t5,n);
xlabel('tiempo(seg)');
ylabel('amplitud(V)');
title('Modulación FSK');


