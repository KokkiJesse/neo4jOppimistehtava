
// Näyttää käyttäjän omistamat pelit
MATCH (k:Kayttaja {nimi: "Janne"})-[:OMISTAA]->(p:Peli)
RETURN p.nimi;

// Näyttää kaikki pelit, jotka kuuluvat Roguelike-genreen
MATCH (p:Peli)-[:KUULUU]->(g:Genre {nimi:"Roguelike"})
RETURN p.nimi;

// Näyttää kaikki pelit, jotka kuuluvat Multiplayer-genreen
MATCH (p:Peli)-[:KUULUU]->(g:Genre {nimi:"Multiplayer"})
RETURN p.nimi;

// Näyttää kaikki käyttäjät, jotka omistavat saman pelin kuin annettu käyttäjä
MATCH (k1:Kayttaja {nimi: "Jesse"})-[:OMISTAA]->(p)<-[:OMISTAA]-(k2:Kayttaja)
WHERE k1 <> k2
RETURN k2.nimi, p.nimi;

// Käyttäjät ja heidän omistamansa pelit (kaikki)
MATCH (k:Kayttaja)-[:OMISTAA]->(p:Peli)
RETURN k.nimi, p.nimi;

// Omistajien määrä per peli
MATCH (k:Kayttaja)-[:OMISTAA]->(p:Peli)
RETURN p.nimi, count(k) AS omistajia
ORDER BY omistajia DESC;

// Näyttää kaikki genret pelille
MATCH (p:Peli {nimi:"Minecraft"})-[:KUULUU]->(g:Genre)
RETURN g.nimi;

// Poistaa käyttäjän "Omistaa" suhteen tiettyyn peliin
MATCH (k:Kayttaja {nimi:"Jonne"})-[r:OMISTAA]->(p:Peli {nimi:"MEGABONK"})
DELETE r
RETURN k.nimi, p.nimi;

// Poistaa annetun käyttäjän ja kaikki hänen suhteensa
MATCH (k:Kayttaja {nimi:"Liisa"})
DETACH DELETE k;