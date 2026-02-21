
// Näyttää käyttäjän pelaamat pelit
MATCH (k:Kayttaja {id: 3})-[:PELAA]->(p:Peli)
RETURN p.nimi;

// Näyttää kaikki pelit, jotka kuuluvat Roguelike-genreen
MATCH (p:Peli)-[:KUULUU]->(g:Genre {nimi:"Roguelike"})
RETURN p.nimi;

// Näyttää kaikki pelit, jotka ovat saatavilla Nintendo Switch -alustalla
MATCH (p:Peli)-[:SAATAVILLA]->(a:Alusta {nimi:"Nintendo Switch"})
RETURN p.nimi;

// Näyttää kaikki käyttäjät, jotka omistavat saman pelin kuin annetu ID
MATCH (k1:Kayttaja {id: 1})-[:OMISTAA]->(p)<-[:OMISTAA]-(k2:Kayttaja)
WHERE k1 <> k2
RETURN k2.id, k2.nimi, p.nimi;

// Käyttäjät, jotka omistavat pelin mutta eivät pelaa sitä
MATCH (k:Kayttaja)-[:OMISTAA]->(p:Peli)
WHERE NOT (k)-[:PELAA]->(p)
RETURN k.id, k.nimi, p.nimi;

// Pelaajaiden määrä per peli
MATCH (k:Kayttaja)-[:PELAA]->(p:Peli)
RETURN p.nimi, count(k) AS pelaajia
ORDER BY pelaajia DESC;

// Poistaa käyttäjän "Pelaa" suhteen tiettyyn peliin
MATCH (k:Kayttaja {id:2})-[r:PELAA]->(p:Peli {nimi:"MEGABONK"})
DELETE r
RETURN k.nimi, p.nimi;

// Poistaa annetun käyttäjän ja kaikki hänen suhteensa
MATCH (k:Kayttaja {id:4})
DETACH DELETE k;