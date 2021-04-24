# :house: Controle de estacionamento de caminhões

Este é um projeto de estudo para aplicar o conhecimento em criação de layouts com Flutter.

## :hammer_and_wrench: Tecnologias e packages

- Dart
- Flutter SDK
- google_fonts 2.0.0
- flutter_vector_icons 1.0.0
- timelines 0.1.0

## :books: Assuntos abordados

- Detecção de gestos
- Criação de interfaces
- Posicionamento de Widgets
- Animações implícitas
- Gestão de estados globais e efêmeros
- Funções assíncronas

## :briefcase: Problema proposto

Foi proposto o seguinte problema: 

João nosso cliente nos enviou um problema que envolve o controle da logística de seus caminhões na garagem, ele não consegue saber qual caminhão está em qual vaga, e qual horário ele entrou e saiu da vaga. Isso é importante para ele saber quantos motoristas ele tem no pátio para fazer as entregas do dia. João é um administrador mais velho, então uma interface fácil de utilizar é mais vantajoso que uma interface muito complexa.

O que esperamos? Uma interface onde consigo ver os caminhões, ver a vaga que ele está e o horário que ele entrou e se estiver vazio, o último caminhão que esteve e o horário de saída.

Requisitos: Flutter mobile, desktop ou web.

## :abacus: Proposta de solução

Foi proposta uma interface onde o João possa ter acesso a uma lista de caminhões e uma lista de vagas.

![Demostração](https://raw.githubusercontent.com/danilogocarlos/tracking_trucks_parking/main/assets/gifs/00.gif)

Na listagem de caminhões, João poderá filtrar os caminhões em todos, disponíveis e ocupados. Assim ficará mais fácil ele identificar quais caminhões estão à disposição e quais não estão. Além disso, João pode selecionar um caminhão para ver os detalhes sobre aquele caminhão e os horários de entrada e saída das vagas que teve acesso durante o dia.

![Demostração](https://raw.githubusercontent.com/danilogocarlos/tracking_trucks_parking/main/assets/gifs/01.gif)

De forma análoga, João poderá acessar as vagas tendo o controle de quais estão disponíveis e quais estão indisponíveis. Além de ter acesso aos detalhes e histórico de acesso àquela vaga.

![Demostração](https://raw.githubusercontent.com/danilogocarlos/tracking_trucks_parking/main/assets/gifs/02.gif)
