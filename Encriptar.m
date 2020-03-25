function gx = Encriptar(fx, H, seconds) %Funci�n que realiza encriptaci�n del audio
    x = linspace(0,0,192); % Vector de 0�s que ocupa para rellenar el vector
    ai = 1;
    bi = 192;
    ci = 1;
    for i = 1 : seconds
        aux = [fx(ai:8000*i); x']; %Indexacion de los 0�s
        aux = H * aux; %Encriptaci�n del vector
        gx(ci:8000*i+bi) = aux; %Reconstrucci�n del vector 
        ai = ai + 8000;
        bi = bi + 192;
        ci = ci + 8192;
    end
    gx = gx';
end