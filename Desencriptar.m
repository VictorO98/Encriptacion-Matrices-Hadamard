function ftp = Desencriptar(gx, H, seconds) %Función para desencriptar el vector de frecuencias
    ai = 1;
    bi = 192;
    ci = 0;
    di = 1;
    for i = 1 : seconds
        aux = gx(ai:8000*i+bi); %Se adquieren las vectores particionados con los 0's
        fpx(ai:8000*i+bi) = (transpose(H) * aux)/8192; %Desencriptación del vector de frecuencias
        ftp(di:8000*i)=fpx(ai:8000*i+ci); %Se eliminan los 0's del vector para recuperar el audio original
        ai = ai + 8192;
        bi = bi + 192;
        ci = ci + 192;
        di = di + 8000;
    end
    ftp = ftp';
end