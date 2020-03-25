function fx = Grabar(segundos) %Función que realiza la grabación 
    recObj = audiorecorder; %Objeto para realizar la grabación del audio
    disp('Start speaking.') ;
    recordblocking(recObj, segundos); 
    disp('End of Recording.');
    play(recObj); 
    fx = getaudiodata(recObj);
    %1 segundo = 8000 ... 2^13
     %2 segundo = 16000 
      %3 segundo = 24000
end