// pelien nimi on uniikki
CREATE CONSTRAINT peli_nimi_unique IF NOT EXISTS
FOR (p:Peli)
REQUIRE p.nimi IS UNIQUE;


// Luo kaikki solmut ja suhteet
CREATE
// Käyttäjät
(jesse:Kayttaja {nimi:"Jesse", ika:26}),
(jonne:Kayttaja {nimi:"Jonne", ika:30}),
(janne:Kayttaja {nimi:"Janne", ika:22}),
(liisa:Kayttaja {nimi:"Liisa", ika:24}),

// Pelit
(wow:Peli {nimi:"World of Warcraft"}),
(lbp:Peli {nimi:"Little Big Planet"}),
(minecraft:Peli {nimi:"Minecraft"}),
(megabonk:Peli {nimi:"MEGABONK"}),
(cotl:Peli {nimi:"Cult of the Lamb"}),
(overwatch:Peli {nimi:"Overwatch"}),
(marvelRivals:Peli {nimi:"Marvel Rivals"}),

// Genret
(mmorpg:Genre {nimi:"MMORPG"}),
(platformer:Genre {nimi:"Platformer"}),
(sandbox:Genre {nimi:"Sandbox"}),
(roguelike:Genre {nimi:"Roguelike"}),
(heroShooter:Genre {nimi:"Hero Shooter"}),
(survival:Genre {nimi:"Survival"}),
(multiplayer:Genre {nimi:"Multiplayer"}),

// Käyttäjien ja pelien väliset suhteet
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

// Pelien ja genrejen väliset suhteet
(wow)-[:KUULUU]->(mmorpg),
(wow)-[:KUULUU]->(multiplayer),
(lbp)-[:KUULUU]->(platformer),
(lbp)-[:KUULUU]->(multiplayer),
(minecraft)-[:KUULUU]->(sandbox),
(minecraft)-[:KUULUU]->(survival),
(minecraft)-[:KUULUU]->(multiplayer),
(megabonk)-[:KUULUU]->(roguelike),
(megabonk)-[:KUULUU]->(survival),
(cotl)-[:KUULUU]->(roguelike),
(overwatch)-[:KUULUU]->(heroShooter),
(overwatch)-[:KUULUU]->(multiplayer),
(marvelRivals)-[:KUULUU]->(heroShooter),
(marvelRivals)-[:KUULUU]->(multiplayer);