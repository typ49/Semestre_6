def que_des_majuscules(texte,taille_bloc=5):
    # remplace les caracteres accentues, supprime les espaces et la ponctuation
    # renvoie une chaine de lettres majuscules
    chaine = ""
    i=0  # tient le compte des lettres du message transforme
    texte = texte.lower()
    for c in texte:
        if 97 <= ord(c) <= 122:
            chaine += chr(ord(c)-32)
        elif c in ("Ã¤","Ã ","Ã¢"):
            chaine += "A"
        elif c in ("Ã©","Ã¨","Ã«","Ãª"):
            chaine += "E"
        elif c in ("Ã®","Ã¯"):
            chaine += "I"
        elif c in ("Ã´","Ã¶"):
            chaine += "O"
        elif c in ("Ã¼","Ã»","Ã¹"):
            chaine += "U"
        elif c == "Ã§":
             chaine += "C"
        else:   # on ne tient pas compte du caractere lu
            i -= 1
        i+=1
        if taille_bloc>0 and i%taille_bloc==0 and i>0 and chaine[-1] != " ":
            chaine+=" "  # ajoute une espace tous les "taille_bloc" caracteres
    return chaine


def freq(texte):
    chaine = que_des_majuscules(texte,0)
    frequences = [0]*26
    n = len(chaine)
    for c in chaine:
        frequences[ord(c)-65] += 1
    freq_tuples = [(chr(i+65), frequences[i]) for i in range(26)]
    sorted_freq = sorted(freq_tuples, key=lambda x: x[1], reverse=True)
    ordered_letters = ['E','A','S','I','T','N','R','U','L','O','D','C','M','P','V','Q','F','B','G','H','J','X','Y','Z','W','K']
    letter_mapping = {}
    for i in range(len(ordered_letters)):
        print(f"{sorted_freq[i][0]} ({sorted_freq[i][1]}) --> {ordered_letters[i]}")
        letter_mapping[sorted_freq[i][0]] = ordered_letters[i]
    return letter_mapping

#test
file = "long2.txt"
texte = open(file).read()
mapping = freq(texte)
print(mapping)