# TMDB App

Este é um aplicativo Flutter que exibe filmes da plataforma da TMDB, coms listagem de filmes populares, lançamentos, melhores avaliados e proximos lançamentos.


## Índice
- [Detalhes](#detalhes)
- [Tecnologias utilizadas](#tecnologias-utilizadas)
- [Como gerar apiKey](#como-gerar-apiKey)
- [Como Executar o App](#como-executar-o-app)
- [Como Executar os testes](#como-executar-os-testes)
- [Como fazer o build](#como-fazer-o-build)
- [Telas](#telas)
- [Links](#links)


## Detalhes

O projeto foi desenvolvido utilizando clean architecture e modularização, boas práticas como componentização de widgets, testes unitários, de widgets e de integração. Além disso, foram realizados testes de responsividade em dispositivos Android e iOS.

## Como gerar apiKey

Para o desenvolvimento do app foi utilizado da api da TMDB, para fazer uso dos dados deve ser criada uma conta para gerar a apiKey.
Clique [aqui](https://www.themoviedb.org/settings/api) para gerar sua apiKey.

Informações da API: 
- [TMDB API Docs](https://developer.themoviedb.org/docs/getting-started)
- [TMDB API Reference](https://developer.themoviedb.org/reference/intro/getting-started)

## Tecnologias utilizadas

- Modular: Injeção de dependência e navegação
- Mobx: Gerenciamento de estado
- Logger: Observabilidade
- Mocktail e Network Image Mock: Testes
- Dio: Consumo de API
- Dartz: Erros e exceções
- Carousel Slider: Para criação do widget do carrossel


## Como Executar o app

1. Faça o download dos arquivos pelo gitHub.

2. Na pasta da raiz do projeto abra o terminal e rode os seguintes comandos em ordem:

   `flutter pub get`

   `flutter pub run build_runner build --delete-conflicting-outputs`

   `flutter run --dart-define=API_KEY=YOUR_API_KEY `


## Como Executar os testes

1. Para rodas os testes unitarios e de widgets rode no terminal o comando:

   `flutter test`

2. Para rodar os teste de integração conecte com seu aparelho celular e rode individual os testes em seus arquivos usando o comando:

   `flutter test ./test_integration/modules/tmdb/FILE_NAME`

## Como fazer o Build

1. Para criar o build web rode esse comando:

`flutter build web --release --dart-define=API_KEY=YOUR_API_KEY`

2. Para criar o build app rode esse comando:

`flutter build apk --release --dart-define=API_KEY=YOUR_API_KEY`

## Telas

Obs.: Imagens capturadas de um celular samsung e chrome.

**Splash Page**

O acesso ao aplicativo começa com uma Splash Page temática. Essa escolha foi um toque criativo para maior imersividade do usuário com o app.

Obs.: Imagens capturadas de um celular samsung.


![](/assets/prints/splashPage.jpg)


**Home Page**

Na Home Page temos uma barra de pesquisa, um carrossel automático que exibe a listagem de filmes populares, podendo também ter seu scroll utilizado de forma manual e 3 sliders com outras listagens de filmes tematicas que tem o scroll horizontal manual e um botão 'ver mais' que leva o usuário a uma pagina com scroll inifinito da tematica selecionada. Cada cartão de filme é clicável, levando o usuário à página de descrição do filme selecionado. 

A escolha do carrossel automático adiciona uma sensação de movimento ao aplicativo, e o controle manual permite que o usuário navegue rapidamente pelos filmes, se necessário. 


MOBILE

![](/assets/prints/homePage.jpg)

WEB

![](/assets/prints/homePageWeb.jpg)

**More Movies Page**

Ao clicar no botão ver mais ele irá retorna uma pagina de scroll inifinito com a lista completa da tematica escolhida. Trazendo o poster e nome dos filmes e ao clicar o usuário é enviando para a pagina de descrição do filme selecionado.


MOBILE

![](/assets/prints/moreMoviesPage.jpg)

WEB

![](/assets/prints/moreMoviesPageWeb.jpg)

**Search Page**

Ao digitar a sua pesquisa na barra de pesquisas e clicar no botão de envio, o usuário é levado para a pagina de pesquisas que retorna todos os filmes com aquele termo do banco de dados da TMDB. É uma pagina com scroll inifinito que retorna o poster e o nome dos filmes, também contém tratativa de erros quando não temos o retorno de dados do backend. Ao clicar na imagem o usuário é enviando para a pagina de descrição do filme selecionado.


MOBILE

![](/assets/prints/searchPage.jpg)
![](/assets/prints/tratativaError.jpg)

WEB

![](/assets/prints/searchPageWeb.jpg)

**Description Page**

Ao clicar no cartão de um filme, o usuário é direcionado à página de descrição, que exibe a imagem, nome, descrição, avaliação, data de lançamento e elenco do filme selecionado.

Observação: Nem todos os filmes retornam todos os dados utilizados no app na API, então foi implementado um tratamento de erro para lidar com esse tipo de retorno.


MOBILE 

![](/assets/prints/descriptionPage.jpg)

![](/assets/prints/descriptionPage2.jpg)

![](/assets/prints/tratativaError2.jpg)

WEB

![](/assets/prints/descriptionPageWeb.jpg)

![](/assets/prints/descriptionPage2Web.jpg)



**Error Page**

Quando se tem um retorno de erro da api, é direcionado a uma pagina de erro aonde é informado ao usuário sobre o problema tecnico e com um botão para saida do app. Evitando o acesso a pagina da home sem as informações de retorno, devido a algum problema na chamada ou na api em questão.


MOBILE

![](/assets/prints/errorPage.jpg)

WEB

![](/assets/prints/errorPageWeb.jpg)

## Links

Clique [aqui](https://lais2211.github.io/tmdb_app/) para acesso da versão web.

Clique [aqui](https://drive.google.com/file/d/11KYvDaM8YkEJYiYAfv2VMeIK3Smcsd57/view?usp=drive_link) para acesso da versão android Mobile.


