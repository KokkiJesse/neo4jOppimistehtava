# NoSQL-Tietokanta Oppimistehtävä: Neo4j

Neo4j tietokanta pelikirjastosovellukselle.

## Pelikirjasto

**Kuvaus:** Tietokanta näyttää käyttäjiä, pelejä, genrejä ja niiden välisiä suhteita. Neo4j valittiin kantaa varten, koska sovelluksen keskiössä ovat käyttäjien, pelejen ja yms. suhteet. Pelikirjastossa ei ole olennaista yksittäinen tieto, vaan miten eri kohteet liittyvät toisiinsa. Tietokannan avulla on mahdollista selvittää esim. ketkä käyttäjät voisivat pelata yhdessä.

**Testaus:**

1. Kloonaa repositorio itsellesi ja siirry hakemistoon.
2. Käynnistä docker: `docker compose up -d`
3. Mene selaimella osoitteeseen: `http://localhost:7474/browser/`
4. Luo data `create_data.cypher` tiedoston sisällöllä selaimessa tai komentorivillä ajamalla `docker exec -i neo4j cypher-shell -u neo4j -p password < create_data.cypher` projektin hakemistossa
5. Voit testata tietokantaa ajamalla `queries.cypher` tiedoston kyselyitä selaimessa.
