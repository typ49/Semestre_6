# 4 - XPath

## 4.1 - Expression en XPath

### (i)

>
> count (/cine-club/showing/opening \[date/@year=2004])
>

### (ii)

>
> count (distinct-values (/cine-club/showing/opening/@for-film))
>

### (iii)

>
> /cine-club/film-list/film \[@dvd-issued="yes"]/title
>

### (iv)

>
> /cine-club/film-list/film/title \[contains(.,"King")] \[position() = last()]
>

### (v)

>
> /cine-club/showing/opening \[date/@year=2004]/@for-film
>

### (vi)

>
> /cine-club/showing/opening \[id (@for-film)/@dvd-issued!="yes"]/date
>

### (vii)

>
> id (/cine-club/showing/opening \[date/@year=2005 and date/@month=1 and date/@day=1]/@for-film)
>

### (viii)

>
> /cine-club/showing/opening \[date/@day=17 and date/@month=2 and date/@year=2004 and @for-film="rabbi-jacob"]
>

### (ix)

>
> /cine-club/showing/opening \[date/@day=17 and date/@month=2 and date/@year=2004 and normalize-space (id (@for-film)/title)="Les aventures de Rabbi Jacob"]
>

### (x)

>
>
>

### (xi)

>
>
>

### (xii)

>
>
>

### (xiii)

>
>
>

### (xiv)

>
>
>

### (xv)

>
>
>

### (xvi)

>
>
>

### (xvii)

>
>
>

### (xviii)

>
>
>
