clear ('variables')
close all
clc

dimensoes = 3; %dimensões ex: banana, maçã e graviola
niveis = 1; %niveis ex: forma, cor e peso
caracteristicas = 50; %total de caracteristicas de cada nivel do sistema
limite = 10; %definição da area de atuação do sistema
posicao = limite*rand(caracteristicas,2); %posiçãos das caracteristicas
error = [0.5 0.5]; %criterio de inicio de parada, menor deslocamento
deslocamento = 10^7; %inicialização do deslocamento em um valor alto para poder iniciar o while


for j=1:dimensoes
    centroide(j).posi = limite*rand(1,2); %vetor dos centroides - posição dos centroides
    centroide(j).caract = []; %posição das caracteristicas do(s) nivei(s)
end

%%%%%%%%% Plot das posições iniciais %%%%%%%%%%%%
plot(posicao(:,1),posicao(:,2),'ko','LineWidth', 1, 'MarkerFaceColor',[0,0,0])
hold on

% 1º Centroide %
plot(centroide(1).posi(1,1),centroide(1).posi(1,2), 'rs','LineWidth', 5, 'MarkerFaceColor',[1,0,0])

% 2º Centroide %
plot(centroide(2).posi(1,1),centroide(2).posi(1,2), 'gs','LineWidth', 5, 'MarkerFaceColor',[0,1,0])    

% 3º centroide %
plot(centroide(3).posi(1,1),centroide(3).posi(1,2), 'bs','LineWidth', 5, 'MarkerFaceColor',[0,0,1])

hold off
title(['k-means. Iteração: 1'])
xlabel('Eixo X')
ylabel('Eixo Y')
pause(15)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

iter = 0; %Iterações do sistema
parada = 0; %Inicio da parada

while parada < 3 %Quando parada for maior que três, o sistema irá parar
    
    for j=1:dimensoes
        centroide(j).caract = []; %reseta as caracteristicas nos centroides
    end
    
    for i=1:length(posicao)
        for j=1:dimensoes
            tempx=(posicao(i,1)-centroide(j).posi(1,1))^2; %diferença da distancia entre dois pontos no eixo X elevado ao quadrado
            tempy=(posicao(i,2)-centroide(j).posi(1,2))^2; %diferença da distancia entre dois pontos no eixo Y elevado ao quadrado
            distancia(i,j)=sqrt(tempx + tempy); %distancia euclidiana
        end
        [euclidian,indx] = min(distancia(i,:)); %seleciona a distancia euclidiana mais proxima
        [linha,coluna] = size(centroide(indx).caract); %encontra a quantidade de linhas do centroide para colocar o novo valor abaixo da ultima linha
        centroide(indx).caract(linha+1,:) = [posicao(i,:)]; %define que a nova ultima linha do centroide é igual a caracterista mais proxima ao centroide em questão
    end
      
    for j=1:dimensoes
        temp = centroide(j).posi; %armazena a posição atual do centroide temporariamente 
        centroide(j).posi = [mean(centroide(j).caract(:,1)) mean(centroide(j).caract(:,2))]; %define uma nova posição do centroide com base na media das caracteristicas pertencentes a ele
        tempx = (temp(1,1)-centroide(j).posi(1,1))^2; %diferença da distancia entre dois pontos no eixo X elevado ao quadrado
        tempy = (temp(1,2)-centroide(j).posi(1,2))^2; %diferença da distancia entre dois pontos no eixo Y elevado ao quadrado
        deslocamento(1,j)= sqrt(tempx + tempy); %distancia euclidiana
    end
    
    iter = iter + 1; %Soma mais um na distancia euclidiana
    
    if max(deslocamento) < error %confere se o maior deslocamento entre os centroides é maior que o erro minimo aceitavel pelo sistema
        parada = parada + 1; %adiciona mais um no valor do criterio de parada
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Area do PLOT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %%% Centroide 1 %%%
    plot(centroide(1).caract(:,1),centroide(1).caract(:,2), 'ro','LineWidth', 1,'MarkerFaceColor',[1,0,0])
    hold on
    plot(centroide(1).posi(1,1),centroide(1).posi(1,2), 'rs','LineWidth', 5, 'MarkerFaceColor',[1,0,0])
    
    %%% Centroide 2 %%%
    plot(centroide(2).caract(:,1),centroide(2).caract(:,2), 'go','LineWidth', 1, 'MarkerFaceColor',[0,1,0])
    plot(centroide(2).posi(1,1),centroide(2).posi(1,2), 'gs','LineWidth', 5, 'MarkerFaceColor',[0,1,0])    
    
    %%% Centroide 3 %%%
    plot(centroide(3).caract(:,1),centroide(3).caract(:,2), 'bo','LineWidth', 1, 'MarkerFaceColor',[0,0,1])
    plot(centroide(3).posi(1,1),centroide(3).posi(1,2), 'bs','LineWidth', 5, 'MarkerFaceColor',[0,0,1])
    
    %%% caracteristicas do plot %%%
    
    title(['k-means. Iteração: ',  num2str(iter)])
    xlabel('Eixo X')
    ylabel('Eixo Y')
    
    hold off
    pause(1)
end

