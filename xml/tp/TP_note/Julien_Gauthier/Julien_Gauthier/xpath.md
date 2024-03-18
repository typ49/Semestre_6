## 1 : les année de sortie des films (attributs year) jouée par l'acteur dont la clé est craig

>    /film-series/film-list/film[@starring='craig']/@year

## 2 : le nombres de personnes (éléments personname) qui sont des compositeurs de musique encore en vie aujourd'hui

>    count(/film-series/people/personname[@role='composer' and not(@dead)])

## 3 : le nombre de films dont le titre original contient le mot anglais "golden"

>    count(/film-series/film-list/film/title[contains(., 'Golden') or contains(., 'golden')])

## 4 : les films (élément film) dont le rôle principal à été tenu par un acteur né en Irlande (l'indicatif ISO de ce pays est IE)

>    /film-series/film-list/film[@starring=/film-series/people/personname[@born-as='IE']/@key]

---

on se place ensuite à la ligne : <film year="1985" starring="moore" after="fleming" music-by="barry">
donner sous la forme de chemins relatif

## 5 : le titre (élément title) du plus proche film précédant l'élément courant et n'appartenant pas à la série "officiel"

>    preceding-sibling::film[@official='false'][1]/title

## 6 : le nombre de films suivant l'élément courant et pour lequels la musique à été écrite par le compositeur dont l'identificateur univoque est barry

>    count(following-sibling::film[@music-by='barry'])
