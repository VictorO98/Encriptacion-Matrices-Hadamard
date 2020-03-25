function fx = Grabar(segundos) %Funci�n que realiza la grabaci�n 
    recObj = audiorecorder; %Objeto para realizar la grabaci�n del audio
    disp('Start speaking.') ;
    recordblocking(recObj, segundos); 
    disp('End of Recording.');
    play(recObj); 
    fx = getaudiodata(recObj);
    %1 segundo = 8000 ... 2^13
     %2 segundo = 16000 
      %3 segundo = 24000
end