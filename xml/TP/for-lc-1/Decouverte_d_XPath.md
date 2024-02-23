# Découverte d’XPath

## la deuxième ligne de la deuxième strophe

- 0 - cat poemefr0/corps/strophe[2]/ligne[2]
- 1 - cat poemefr1/corps/ligne\[@strophe = "oui"][2]/following-sibling::ligne[1]

## la deuxième ligne de chaque strophe

- 0 cat poemefr0/corps/strophe/ligne[2]
- 1 cat poemefr1/corps/ligne[@strophe = "oui"]/following-sibling::ligne[1]

## la dixième ligne depuis le début du poème, sans recommencer la numérotation à chaque strophe

- 0 - cat poemefr0/corps/descendant::ligne[10]
- 1 - cat poemefr1/corps/ligne[10]

## toutes les lignes précédant une ligne avec renfoncement (sans tenir compte de la subdivision par strophes)

- 0 - cat poemefr0/corps/descendant::ligne[following-sibling::ligne[1]/r]
- 1 - cat poemefr1/corps/ligne[following-sibling::ligne[1]\[@r != "0em"]]

## toutes les lignes sauf la deuxième ligne de chaque strophe

- 0 - cat poemefr0/corps/strophe/ligne[position() != 2]
- 1 - cat poemefr1/corps/ligne[preceding-sibling::ligne[1]\[@strophe != "oui"]]

---

## Les titres des œuvres en allemand

cat /sf-1/entries/*[@xml:lang="de"]/title

```shell
 -------
<title>Kelwitts Stern</title>
 -------
<title><skippable>Der </skippable>Alptraummann</title>
 -------
<title>Solar Station</title>
 -------
<title>Dinoland</title>
 -------
<title><skippable>Auf der </skippable>Spur des Vernichters</title>
```

## Le nombre d’œuvres qui sont des nouvelles extraites d’anthologies

xpath count(/sf-1/entries/inproceedings)

> Object is a number : 4

## Le nombre d’ouvrages qui sont des anthologies

xpath count(/sf-1/entries/book[editor and not(author)])

> Object is a number : 1

## Le nombre de notes qui contiennent un texte en allemand

xpath count(/sf-1/entries/book/note[descendant::group/@xml:lang='de'])

> Object is a number : 6

## Les clés des auteurs qui ont écrit à deux ou plusieurs

cat sf-1/entries/*/author/personrefs[count(id(@to))>1]/@to

```shell
-------
to="souvestre allain"
```

## Les prénoms et noms des auteurs qui ont écrit à deux ou plusieurs

cat id(sf-1/entries/*/author/personrefs[count(id(@to))>1]/@to)/first | id(sf-1/entries/*/author/personrefs[count(id(@to))>1]/@to)/last

```shell
 -------
<first>Marcel</first>
 -------
<last>Allain</last>
 -------
<first>Pierre</first>
 -------
<last>Souvestre</last>
```

## Les titres d’œuvres dont au moins un auteur a utilisé un pseudonyme

cat /sf-1/entries/*[id(author/personrefs/@to)/pseudonym-of]/title

```shell
 -------
<title><skippable>The </skippable>Running Man</title>
 -------
<title>I Know What You Did Last Summer</title>
 -------
<title>Murder Melody</title>
 -------
<title><skippable>The </skippable>Flaming Falcons</title>
 -------
<title><skippable>Auf der </skippable>Spur des Vernichters</title>
```
