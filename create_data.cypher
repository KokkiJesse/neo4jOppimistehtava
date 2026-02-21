// pelien nimi on uniikki
CREATE CONSTRAINT peli_nimi_unique IF NOT EXISTS
FOR (p:Peli)
REQUIRE p.nimi IS UNIQUE;

// käyttäjän id on uniikki
CREATE CONSTRAINT kayttaja_id_unique IF NOT EXISTS
FOR (k:Kayttaja)
REQUIRE k.id IS UNIQUE;


// Käyttäjät
CREATE (jesse:Kayttaja {id: 1, nimi:"Jesse", ika:26});
CREATE (jonne:Kayttaja {id: 2, nimi:"Jonne", ika:30});
CREATE (janne:Kayttaja {id: 3, nimi:"Janne", ika:22});
CREATE (liisa:Kayttaja {id: 4, nimi:"Liisa", ika:24});

// Pelit
CREATE (wow:Peli {nimi:"World of Warcraft", vuosi:2004});
CREATE (lbp:Peli {nimi:"Little Big Planet", vuosi:2008});
CREATE (minecraft:Peli {nimi:"Minecraft", vuosi:2009});
CREATE (megabonk:Peli {nimi:"MEGABONK", vuosi:2025});
CREATE (cotl:Peli {nimi:"Cult of the Lamb", vuosi:2022});

// Genret
CREATE (mmorpg:Genre {nimi:"MMORPG"});
CREATE (platformer:Genre {nimi:"Platformer"});
CREATE (sandbox:Genre {nimi:"Sandbox"});
CREATE (roguelike:Genre {nimi:"Roguelike"});


// Alustat
CREATE (pc:Alusta {nimi:"PC"});
CREATE (ps:Alusta {nimi:"PlayStation"});
CREATE (xbox:Alusta {nimi:"Xbox"});
CREATE (nintendo:Alusta {nimi:"Nintendo Switch"});

// Relaatiot
CREATE
(jesse)-[:OMISTAA]->(wow),
(jesse)-[:PELAA]->(wow),
(jesse)-[:OMISTAA]->(minecraft),
(jesse)-[:OMISTAA]->(lbp),
(jesse)-[:OMISTAA]->(megabonk),
(jesse)-[:OMISTAA]->(cotl),

(jonne)-[:OMISTAA]->(lbp),
(jonne)-[:PELAA]->(lbp),
(jonne)-[:OMISTAA]->(megabonk),
(jonne)-[:PELAA]->(megabonk),

(janne)-[:OMISTAA]->(minecraft),
(janne)-[:PELAA]->(minecraft),
(janne)-[:OMISTAA]->(cotl),
(janne)-[:PELAA]->(cotl),

(liisa)-[:OMISTAA]->(megabonk),
(liisa)-[:PELAA]->(megabonk),
(liisa)-[:OMISTAA]->(cotl),

(wow)-[:KUULUU]->(mmorpg),
(lbp)-[:KUULUU]->(platformer),
(minecraft)-[:KUULUU]->(sandbox),
(megabonk)-[:KUULUU]->(roguelike),
(cotl)-[:KUULUU]->(roguelike),

(wow)-[:SAATAVILLA]->(pc),
(lbp)-[:SAATAVILLA]->(ps),
(megabonk)-[:SAATAVILLA]->(pc),
(cotl)-[:SAATAVILLA]->(pc),
(cotl)-[:SAATAVILLA]->(xbox),
(cotl)-[:SAATAVILLA]->(ps),
(cotl)-[:SAATAVILLA]->(nintendo),
(minecraft)-[:SAATAVILLA]->(pc),
(minecraft)-[:SAATAVILLA]->(xbox),
(minecraft)-[:SAATAVILLA]->(ps),
(minecraft)-[:SAATAVILLA]->(nintendo);