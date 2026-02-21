// Constraintit
CREATE CONSTRAINT peli_nimi_unique IF NOT EXISTS
FOR (p:Peli)
REQUIRE p.nimi IS UNIQUE;

CREATE CONSTRAINT kayttaja_id_unique IF NOT EXISTS
FOR (k:Kayttaja)
REQUIRE k.id IS UNIQUE;

// Luodaan Käyttäjät
CREATE (jesse:Kayttaja {id: 1, nimi:"Jesse", ika:26});
CREATE (jonne:Kayttaja {id: 2, nimi:"Jonne", ika:30});
CREATE (janne:Kayttaja {id: 3, nimi:"Janne", ika:22});
CREATE (liisa:Kayttaja {id: 4, nimi:"Liisa", ika:24});

// Luodaan Pelit
CREATE (wow:Peli {nimi:"World of Warcraft"});
CREATE (lbp:Peli {nimi:"Little Big Planet"});
CREATE (minecraft:Peli {nimi:"Minecraft"});
CREATE (megabonk:Peli {nimi:"MEGABONK"});
CREATE (cotl:Peli {nimi:"Cult of the Lamb"});
CREATE (overwatch:Peli {nimi:"Overwatch"});
CREATE (marvelRivals:Peli {nimi:"Marvel Rivals"});

// Luodaan Genret
CREATE (mmorpg:Genre {nimi:"MMORPG"});
CREATE (platformer:Genre {nimi:"Platformer"});
CREATE (sandbox:Genre {nimi:"Sandbox"});
CREATE (roguelike:Genre {nimi:"Roguelike"});
CREATE (heroShooter:Genre {nimi:"Hero Shooter"});
CREATE (survival:Genre {nimi:"Survival"});
CREATE (multiplayer:Genre {nimi:"Multiplayer"});
CREATE (basebuilding:Genre {nimi:"Basebuilding"});

MATCH (jesse:Kayttaja {id: 1})
MATCH (jonne:Kayttaja {id: 2})
MATCH (janne:Kayttaja {id: 3})
MATCH (liisa:Kayttaja {id: 4})

MATCH (wow:Peli {nimi:"World of Warcraft"})
MATCH (lbp:Peli {nimi:"Little Big Planet"})
MATCH (minecraft:Peli {nimi:"Minecraft"})
MATCH (megabonk:Peli {nimi:"MEGABONK"})
MATCH (cotl:Peli {nimi:"Cult of the Lamb"})
MATCH (overwatch:Peli {nimi:"Overwatch"})
MATCH (marvelRivals:Peli {nimi:"Marvel Rivals"})

MATCH (mmorpg:Genre {nimi:"MMORPG"})
MATCH (platformer:Genre {nimi:"Platformer"})
MATCH (sandbox:Genre {nimi:"Sandbox"})
MATCH (roguelike:Genre {nimi:"Roguelike"})
MATCH (heroShooter:Genre {nimi:"Hero Shooter"})
MATCH (survival:Genre {nimi:"Survival"})
MATCH (multiplayer:Genre {nimi:"Multiplayer"})
MATCH (basebuilding:Genre {nimi:"Basebuilding"})
// Luodaan kaikki suhteet
CREATE
  (jesse)-[:OMISTAA]->(wow),
  (jesse)-[:OMISTAA]->(minecraft),
  (jesse)-[:OMISTAA]->(lbp),
  (jesse)-[:OMISTAA]->(megabonk),
  (jesse)-[:OMISTAA]->(cotl),
  (jesse)-[:OMISTAA]->(overwatch),
  (jesse)-[:OMISTAA]->(marvelRivals),

  (jonne)-[:OMISTAA]->(lbp),
  (jonne)-[:OMISTAA]->(megabonk),
  (jonne)-[:OMISTAA]->(overwatch),

  (janne)-[:OMISTAA]->(minecraft),
  (janne)-[:OMISTAA]->(cotl),
  (janne)-[:OMISTAA]->(marvelRivals),

  (liisa)-[:OMISTAA]->(megabonk),
  (liisa)-[:OMISTAA]->(cotl),
  (liisa)-[:OMISTAA]->(marvelRivals),

  (wow)-[:KUULUU]->(mmorpg),
  (wow)-[:KUULUU]->(multiplayer),
  (lbp)-[:KUULUU]->(platformer),
  (lbp)-[:KUULUU]->(multiplayer),
  (lbp)-[:KUULUU]->(sandbox),
  (minecraft)-[:KUULUU]->(sandbox),
  (minecraft)-[:KUULUU]->(survival),
  (minecraft)-[:KUULUU]->(multiplayer),
  (minecraft)-[:KUULUU]->(basebuilding),
  (megabonk)-[:KUULUU]->(roguelike),
  (megabonk)-[:KUULUU]->(survival),
  (cotl)-[:KUULUU]->(roguelike),
  (cotl)-[:KUULUU]->(basebuilding),
  (overwatch)-[:KUULUU]->(heroShooter),
  (overwatch)-[:KUULUU]->(multiplayer),
  (marvelRivals)-[:KUULUU]->(heroShooter),
  (marvelRivals)-[:KUULUU]->(multiplayer);