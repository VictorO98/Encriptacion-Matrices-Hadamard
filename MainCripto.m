%Proyecto Final Analisis Númerico
%Víctor Ospina
%Tania Obando
%Diego Galarza
pause on

%Función principal del programa
prompt = 'Por favor digite los segundos hablar: ';
seconds = input(prompt);
H = hadamard(8192); %Matriz Hadamard Estandar

%Grabar Señal
fx = Grabar(seconds);

%Grafica de audio original
subplot(1,3,1);
plot(fx);
xlabel("Señal Original");
ylabel("f(x)");
grid on

%Reproducir Audio De Entrada
prompt = 'Desea escuchar el audio de entrada (S/n): ';
respuesta = input(prompt,'s');
if(strcmp(respuesta,'s') || strcmp(respuesta,'S'))    
    disp('Reproduciendo Audio Original');
    load gong.mat; 
    gong = audioplayer(fx,8192); 
    play(gong);
    pause(seconds); %Le da una pausa al programa para reproducir el audio
end

%Encriptación de señal
gx = Encriptar(fx, H, seconds);

%Grafica de la señal encriptada
subplot(1,3,2);
plot(gx);
xlabel("Señal Encriptada");
ylabel("g(x)");
grid on
title("Encriptamiento de señales con matrices de Hadamard: " + seconds + " Segundos");

%Reproducir Audio Modificado
prompt = 'Desea escuchar el audio modificado (S/n): ';
respuesta = input(prompt,'s');
if(strcmp(respuesta,'s') || strcmp(respuesta,'S'))    
    disp('Reproduciendo el Audio Encriptado');
    load gong.mat; 
    gong = audioplayer(gx,8192); 
    play(gong);
    pause(seconds); %Le da una pausa al programa para reproducir el audio
end

%Desencriptada de señal
ftp = Desencriptar(gx, H, seconds);

%Grafica Audio Recuperao
subplot(1,3,3);
plot(ftp);
xlabel("Señal Desencriptada");
ylabel("f'(x)")
grid on

%Reproducir Audio Modificado
prompt = 'Desea escuchar el audio desencriptado (S/n): ';
respuesta = input(prompt,'s');
if(strcmp(respuesta,'s') || strcmp(respuesta,'S'))    
    disp('Reproduciendo el Audio Recuperado');
    load gong.mat; 
    gong = audioplayer(ftp,8192); 
    play(gong);
    pause(seconds); %Le da una pausa al programa para reproducir el audio
end

%Calculo de Error
Et = max((abs(fx-ftp)/fx)*100)
disp(Et)