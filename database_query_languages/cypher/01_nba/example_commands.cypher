// Nó (Node) = vértice/entidade
// Propriedades = atributos dos nós
// Relacionamento = ligação entre nós
// Aresta = nome técnico da ligação
// Rótulo = tipo do nó

// Comandos de Consulta para Neo4j.
MATCH (n) RETURN n
MATCH (n:PLAYER) RETURN n
MATCH (n:COACH) RETURN n
MATCH (n:TEAM) RETURN n

// -----------------------------

MATCH (n:PLAYER) RETURN n.name
MATCH (n:PLAYER) RETURN n.name, n.height
MATCH (n:PLAYER) RETURN n.name AS Nome, n.height AS Altura
MATCH (n:PLAYER) WHERE n.name = "LeBron James" RETURN n
 
MATCH (p:PLAYER)
RETURN id(p), p.name

MATCH (n:PLAYER)
WHERE id(n) = 1 
RETURN n

MATCH (p:PLAYER {name: "LeBron James"}) RETURN p
MATCH (p:PLAYER {name: "LeBron James", height: 2.06}) RETURN p
MATCH (p:PLAYER) WHERE p.name <> "LeBron James" RETURN p
MATCH (p:PLAYER) WHERE p.height >= 2 RETURN p

MATCH (p:PLAYER) 
WHERE p.height < 2 
RETURN p

MATCH (p:PLAYER)
WHERE (p.weight / (p.height * p.height)) > 25
RETURN p

MATCH (p:PLAYER)
WHERE p.weight >= 100 AND p.height <= 2
RETURN p

MATCH (p:PLAYER)
WHERE p.weight >= 120 OR p.height >= 2.1
RETURN p

MATCH (p:PLAYER)
WHERE NOT p.weight >= 120 OR p.height >= 2.15
RETURN p

MATCH (p:PLAYER)
WHERE p.height >= 2
RETURN p

MATCH (p:PLAYER)
WHERE p.height >= 2
RETURN p
LIMIT 5

MATCH (p:PLAYER)
WHERE p.height >= 2
RETURN p
LIMIT 2

MATCH (p:PLAYER)
WHERE p.height >= 2
RETURN p
SKIP 2
LIMIT 2

MATCH (p:PLAYER)
WHERE p.height >= 2
RETURN p
ORDER BY p.height DESC

MATCH (p:PLAYER)
WHERE p.height >= 2
RETURN p
ORDER BY p.height ASC

// -----------------------------

MATCH (p:PLAYER), (c:COACH)
RETURN p, c

MATCH (p:PLAYER), (c:COACH)
WHERE p.height >= 2
RETURN p, c

MATCH (p:PLAYER), (c:COACH), (t:TEAM)
WHERE p.height >= 2
RETURN p, c, t

MATCH (n) RETURN n

// -----------------------------

// Especificar/colher pistas sobre os relacionamentos
MATCH (p:PLAYER) -[:PLAYS_FOR]-> (t:TEAM)
WHERE t.name = "LA Lakers"
RETURN p

MATCH (p:PLAYER) -[:PLAYS_FOR]-> (t:TEAM)
WHERE t.name = "LA Lakers"
RETURN p, t

MATCH (p:PLAYER) -[:PLAYS_FOR]-> (t:TEAM)
WHERE t.name = "LA Lakers"
OR t.name = "Dallas Mavericks"
RETURN p, t

MATCH (p:PLAYER) - [contract:PLAYS_FOR] ->
(t:TEAM)
WHERE contract.salary >= 35000000
RETURN p

MATCH (p:PLAYER) - [contract:PLAYS_FOR] ->
(t:TEAM)
WHERE contract.salary >= 35000000
RETURN p, t

MATCH (p:PLAYER {name: "LeBron James"}) - [:TEAMMATES] ->
(t:PLAYER)
RETURN t

MATCH (p:PLAYER {name: "LeBron James"}) -
[:TEAMMATES] -> (teammate:PLAYER)
MATCH (teammate) - [contract:PLAYS_FOR] ->
(team:TEAM)
WHERE contract.salary >= 38000000
RETURN teammate

MATCH (n) RETURN n

// -----------------------------

// Agregação

MATCH (p:PLAYER) -
[gamePlayed:PLAYED_AGAINST] -> (:TEAM)
RETURN p.name, COUNT(gamePlayed)

MATCH (p:PLAYER) -
[gamePlayed:PLAYED_AGAINST] -> (:TEAM)
RETURN p.name, AVG(gamePlayed.points)

MATCH (p:PLAYER) -
[gamePlayed:PLAYED_AGAINST] -> (:TEAM)
RETURN p.name, AVG(gamePlayed.points) AS PontosPorJogo
ORDER BY PontosPorJogo DESC
LIMIT 1

MATCH (n) RETURN n

// -----------------------------

// Deletando os nós e relacionamentos

// Não possui relacionamentos
MATCH (n {name: "Nick Nurse"})
DELETE n

// Já possui relacionamentos
MATCH (n {name: "Ja Morant"})
DETACH DELETE n

MATCH (n) RETURN n

// Excluir relacionamento
MATCH (n {name: "Joel Embiid"}) -
[rel:PLAYS_FOR] -> (:TEAM)
DELETE rel

// Apaga nós e relacionamenos
MATCH (n)
DETACH DELETE n

MATCH (n) RETURN n

// -----------------------------

// Criando nós e relacionamentos
CREATE (n:PLAYER:COACH:GENERAL_MANAGER
{name: "LeBron James", height: 2.01})
RETURN n

CREATE (:PLAYER) - [:PLAYS_FOR {salary:
34000000}] -> (:TEAM {name: "LA Lakers"})

MATCH (n) RETURN n

MATCH (p:PLAYER {name: "LeBron James"}),
(t:TEAM {name: "LA Lakers"})
CREATE (p) - [:PLAYS_FOR {salary: 40000000}]
-> (t)

MATCH (n) RETURN n

MATCH (n {id: 0})
RETURN n

MATCH (n:PLAYER)
WHERE ID(n) = 0
RETURN n

MATCH (n:PLAYER)
WHERE ID(n) = 0
SET n.name = "Anthony Davis"
RETURN n

MATCH (p:PLAYER)
WHERE ID(p) = 3
SET p.height = 2.02, p.age = 36
RETURN p

MATCH (p:PLAYER)
WHERE ID(p) = 3
SET p:REF
RETURN p

MATCH (n {name: "LeBron James"}) -
[contract:PLAYS_FOR] -> (t:TEAM)
RETURN n, t

MATCH (n {name: "LeBron James"}) -
[contract:PLAYS_FOR] -> (t:TEAM)
SET contract.salary = 60000000
RETURN n, t

// Remover atributo
MATCH (n {name: "LeBron James"})
REMOVE n.age
RETURN n

// Remover Label/rotulo
MATCH (n {name: "LeBron James"})
REMOVE n:REF
RETURN n