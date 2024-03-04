# 4 - XPath

## 4.1 - Expression en XPath

### (i)

> count ( /cine-club/showing/opening\[ date/@year=2004] )

### (ii)

> count (distinct-values ( /cine-club/showing/opening/ @for-film ) )

### (iii)

> /cine-club/film-list/film\[ @dvd-issued = "yes" ]/title

### (iv)

> / cine-club / film-list / film / title \[ contains ( ., "King" ) ] \[ position() = last() ]

### (v)

> /cine-club/showing/opening \[ date/@year=2004]/@for-film

### (vi)

> /cine-club/showing/opening \[ id ( @for-film )/@dvd-issued!="yes" ]/date

### (vii)

> id ( /cine-club/showing/opening \[ date/@year=2005 and date/@month=1 and date/@day=1 ]/@for-film )

### (viii)

> /cine-club/showing/opening \[ date/@day=17 and date/@month=2 and date/@year=2004 and @for-film="rabbi-jacob" ]

### (ix)

> /cine-club/showing/opening \[ date/@day=17 and date/@month=2 and date/@year=2004 and normalize-space( id( @for-film )/title ) = "Les Aventures De Rabbi Jacob" ]

### (x)

> count ( /cine-club/showing/opening\[ 60 \* ( ending/@hours - time/@hours ) + ( ending/@minutes - time/@minutes ) > 120 ] )

### (xi)

> /cine-club/showing/opening \[ ending/@hours = 23 and ending/@minutes > 0 ]/date

### (xii)

> /cine-club/film-list/film/title\[ not( contains( normalize-space( . ), ' ' ) ) ]

### (xiii)

> following-sibling :: film\[ @dvd-issued != "yes" ] \[ 1 ]

### (xiv)

> following-sibling :: film\[ @dvd-issued == "yes" ] \[ position() = last() ]

### (xv)

> preceding-sibling :: film\[ @dvd-issued = "yes ]/@key

### (xvi)

> preceding-sibling :: film\[ 1 ]/preceding-sibling :: film\[ 1 ]/title

<!---->

> preceding-sibling :: film\[ 2 ]/title

### (xvii)

> preceding-sibling :: film\[ 1 ] \[ @dvd-issued = "yes" ]/title

### (xviii)

> count( following-sibling :: text( )\[ not( normalize-space( ) ) ] )

## 4.2 - Questions supplémentaires

### 1

>
>> (1)
>> /cine-club/showing/opening\[ ( time | ending )/@minutes > "0" ]
>
> #### (A)
>
>> on peut pas l'utiliser
>
> #### (B)
>
>> l'expression (1) représente ...
>

### 2

> elle retourne toujours un noeud vide
