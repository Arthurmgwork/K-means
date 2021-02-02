# K-means

Função para o Matlab.

É uma função para usar o k-means no matlab. 

Coloquei em anexo um documento pdf "k-means_relatório.pdf" de 21 páginas ensinando a fazer um projetinho com o k-means para classicar a um audio entre voz e periodos de silêncio.


## O que é o K-means?

O K-means é um algoritmo classificador de baixo custo de processamento. O k-means agrupa determinadas características apresentadas ao programa em cluster utilizando ferramentas denominadas de centroides. Os centroides são pontos centrais inicializados em conjunto com os valores das características apresentadas ao programa. Os clusters irão dividir entre si as características inseridas no algoritmo. A Figura abaixo ilustra as características de um K-means utilizando características de valores randômicos.

![iteração 1](https://github.com/Arthurmgwork/K-means/blob/main/Itera%C3%A7%C3%A3o1.JPG)

Os itens representados por bolinhas pretas são as características do sistema. Os itens coloridos em forma de cruz, são os centroides. A divisão das características entre os centroides ocorre por intermédio da distância Euclidiana entre os centroides e as características apresentadas. A Figura 4 apresenta a classificação das características apresentadas acima após 7 iterações.

![iteração 7](https://github.com/Arthurmgwork/K-means/blob/main/Itera%C3%A7%C3%A3o7.JPG)

## Variaveis 

%Posição x
x = [array com as posições no eixo x]

%Posição y
y = [array com as posições no exio y]

% L número de elementos com posições x e y
L = 50

%dimensões ex: banana, maçã e graviola
dimensoes = 3; 


## Como Usar?

Vai chamar a função e colocar suas variaveis. Será retornado um dicionario com o numero de dimensoes. Para cada dimensão vai ter as informações que foram classificadas.

dicionario = kmeans(x,y,L, dimensoes)




