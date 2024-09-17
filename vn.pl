% Fatos dinâmicos para armazenar o personagem
:- dynamic personagem/3.

/*
iniciar o jogo e criar o personagem
*/ 
iniciar :-
    writeln('Bem-vindo ao jogo! Vamos criar seu personagem.'),
    nl,
    writeln('Qual o nome do seu personagem?'),
    read(Nome),
    nl,
    writeln('Qual o sexo do seu personagem? (masculino/feminino):'),
    read(Sexo),
    nl,
    escolher_curso(Curso),
    criar_personagem(Nome, Sexo, Curso),
    writeln('Personagem criado com sucesso!'),
    mostrar_personagem(Nome),
    continuar.

/*
Função para o jogador escolher o curso
*/ 
escolher_curso(Curso) :-
    writeln('Escolha o curso do seu personagem:'),
    writeln('1. Ciencia da Computacao'),
    writeln('2. Ciencia de Dados e IA'),
    writeln('3. Engenharia da Computacao'),
    writeln('Digite o número correspondente:'),
    read(Opcao),
    nl,
    curso(Opcao, Curso).

/*
Mapeamento das opções de curso
*/ 
curso(1, 'Ciencia da Computacao').
curso(2, 'Ciencia de Dados e IA').
curso(3, 'Engenharia da Computacao').
curso(_, _) :- % Caso o jogador insira uma opção inválida
    writeln('Opção invalida. Tente novamente.'),
    escolher_curso(_).

/*
Criação do personagem, armazenando as características como fatos
*/ 
criar_personagem(Nome, Sexo, Curso) :-
    assertz(personagem(Nome, Sexo, Curso)).

/*
Função para exibir os atributos do personagem
*/
mostrar_personagem(Nome) :-
    personagem(Nome, Sexo, Curso),
    format('Seu personagem: ~w\nSexo: ~w\nCurso: ~w\n', [Nome, Sexo, Curso]).
    nl,

/*
Função para dar continuidade à história
*/ 
continuar :-
    personagem(Nome, _, _),
    format('Agora que ~w esta pronto, a aventura comeca...\n', [Nome]),
    mostrar_opcoes.

/*
Função para mostrar as opções e ler a escolha do jogador
*/

mostrar_opcoes :-
    writeln('Entrando no CI, um ambiente hostil e inospitpo, voce se depara com duas opcoes:'),
    writeln('1. Explorar os arredores e se atrasar para aula.'),
    writeln('2. Seguir em frente e ir pra sua aula, mesmo atrasado.'),
    writeln('Escolha uma opcao (1 ou 2):'),
    read(Opcao),
    executar_opcao(Opcao).



/*
Implementação de opções
*/

executar_opcao(1) :-
    writeln('Voce explora o aquario e encontra uma pista misteriosa...'), 
    nl,

    writeln('Voce encontra um bilhete que diz: "Onde o tempo e relativo, a resposta esta escondida."'),
    nl,
    writeln('O que voce faz?'),
    writeln('1. Guarda o bilhete e segue para a aula.'),
    writeln('2. Fica intrigado e decide investigar mais.'),
    read(Opcao),
    executar_opcao(Opcao).






executar_opcao(2) :-
    writeln('Voce entra na sala e se depara com um professor raivoso(Ele dormiu mal e não gosta que se atrasem).'), continuar.







executar_opcao(_) :- % Caso o jogador insira uma opção inválida
    writeln('Opção invalida. Tente novamente.'),
    mostrar_opcoes.

% Começar o jogo
jogar :-
    iniciar.
    