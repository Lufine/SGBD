/*
Curso: Engenharia de Software - UniEVANGÉLICA
Disciplina: Sistemas Gerenciadores de Banco de Dados
Dev: Luiz Filipe Neuwirth
Data: 28/03/2023
*/

/*LEFT JOIN:

    Quando queremos listar todos os jogadores, incluindo aqueles que ainda não possuem equipe atual. Nesse caso, utilizamos um LEFT JOIN entre as tabelas Jogadores e Equipes, selecionando todos os jogadores e as equipes correspondentes (se existirem). Assim, teremos como resultado todos os jogadores, mesmo aqueles que ainda não possuem equipe.

    Ao buscar as informações das partidas, podemos querer listar todas as partidas, mesmo aquelas em que não houve equipe perdedora. Nesse caso, utilizamos um LEFT JOIN entre as tabelas Partidas e Equipes, selecionando todas as partidas e as equipes correspondentes (se existirem). Assim, teremos como resultado todas as partidas, mesmo aquelas em que não houve equipe perdedora.

OUTER JOIN:

    Quando queremos listar todas as equipes e seus respectivos jogadores, incluindo aquelas equipes que ainda não possuem jogadores. Nesse caso, utilizamos um OUTER JOIN entre as tabelas Equipes e Jogadores, selecionando todas as equipes e os jogadores correspondentes (se existirem). Assim, teremos como resultado todas as equipes, mesmo aquelas que ainda não possuem jogadores.

    Ao buscar as informações das partidas, podemos querer listar todas as equipes, incluindo aquelas que não participaram de nenhuma partida. Nesse caso, utilizamos um OUTER JOIN entre as tabelas Equipes e Partidas, selecionando todas as equipes e as partidas correspondentes (se existirem). Assim, teremos como resultado todas as equipes, mesmo aquelas que não participaram de nenhuma partida.

FULL JOIN:

    Quando queremos listar todas as equipes e seus respectivos jogadores, incluindo aquelas equipes que não possuem jogadores e aqueles jogadores que não possuem equipe atual. Nesse caso, utilizamos um FULL JOIN entre as tabelas Equipes e Jogadores, selecionando todas as equipes e os jogadores correspondentes (se existirem). Assim, teremos como resultado todas as equipes e todos os jogadores, incluindo aqueles que ainda não possuem equipe.

    Ao buscar as informações das partidas, podemos querer listar todas as equipes e todas as partidas, incluindo aquelas equipes que não participaram de nenhuma partida e aquelas partidas em que não houve equipe perdedora. Nesse caso, utilizamos um FULL JOIN entre as tabelas Equipes e Partidas, selecionando todas as equipes e todas as partidas correspondentes (se existirem). Assim, teremos como resultado todas as equipes e todas as partidas, incluindo aquelas que não participaram de nenhuma partida e aquelas em que não houve equipe perdedora.*/



/*Situação que requer o uso do comando LEFT JOIN:

Suponha que você queira obter uma lista de todos os jogadores, incluindo aqueles que não estão associados a uma equipe atualmente. Nesse caso, é necessário usar um LEFT JOIN para combinar a tabela de jogadores com a tabela de equipes, de modo que todos os jogadores sejam incluídos na consulta, independentemente de terem uma equipe atual ou não.

Exemplo de consulta:*/

SELECT Jogadores.nome, Equipes.nome AS equipe_atual
FROM Jogadores
LEFT JOIN Equipes ON Jogadores.equipe_atual = Equipes.id_equipe;



/*Situação que requer o uso do comando OUTER JOIN:

Suponha que você queira obter uma lista de todas as partidas, incluindo aquelas em que não houve uma equipe perdedora (por exemplo, em caso de empate). Nesse caso, é necessário usar um OUTER JOIN para combinar a tabela de partidas com a tabela de equipes duas vezes (uma vez para a equipe vencedora e outra para a equipe perdedora), de modo que todas as partidas sejam incluídas na consulta, independentemente de haver uma equipe perdedora ou não.

Exemplo de consulta:*/

SELECT Partidas.id_partida, Equipes_vencedoras.nome AS equipe_vencedora, Equipes_perdedoras.nome AS equipe_perdedora
FROM Partidas
LEFT OUTER JOIN Equipes AS Equipes_vencedoras ON Partidas.equipe_vencedora = Equipes_vencedoras.id_equipe
LEFT OUTER JOIN Equipes AS Equipes_perdedoras ON Partidas.equipe_perdedora = Equipes_perdedoras.id_equipe;



/*Situação que requer o uso do comando FULL JOIN:

Suponha que você queira obter uma lista de todas as equipes que já participaram de um torneio em alguma ocasião, incluindo aquelas que nunca venceram uma partida. Nesse caso, é necessário usar um FULL JOIN para combinar a tabela de equipes com a tabela de partidas duas vezes (uma vez para a equipe vencedora e outra para a equipe perdedora), de modo que todas as equipes sejam incluídas na consulta, independentemente de terem vencido ou perdido uma partida.

Exemplo de consulta:*/

SELECT DISTINCT Equipes.nome
FROM Equipes
FULL OUTER JOIN Partidas AS Vitorias ON Equipes.id_equipe = Vitorias.equipe_vencedora
FULL OUTER JOIN Partidas AS Derrotas ON Equipes.id_equipe = Derrotas.equipe_perdedora
WHERE (Vitorias.equipe_vencedora IS NOT NULL) OR (Derrotas.equipe_perdedora IS NOT NULL);