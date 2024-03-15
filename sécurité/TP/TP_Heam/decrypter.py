# Module de fréquence des lettres

def calculer_frequences(texte):
    """Calcule la fréquence de chaque lettre dans le texte donné."""
    frequences = {}
    total_lettres = 0
    for lettre in texte:
        if lettre.isalpha():
            total_lettres += 1
            if lettre in frequences:
                frequences[lettre] += 1
            else:
                frequences[lettre] = 1
    # Convertir en pourcentage
    for lettre in frequences:
        frequences[lettre] = (frequences[lettre] / total_lettres) * 100
    return frequences

def comparer_frequences(frequences_chiffrees, frequences_attendues):
    """Compare les fréquences des lettres chiffrées avec les fréquences attendues."""
    differences = {}
    for lettre, freq in frequences_chiffrees.items():
        if lettre in frequences_attendues:
            differences[lettre] = abs(freq - frequences_attendues[lettre])
        else:
            differences[lettre] = freq
    return differences


# module mot une lettre
def identifier_mots_une_lettre(texte):
    """Identifie et suggère des corrections pour les mots d'une lettre mal chiffrés."""
    mots_une_lettre = ['A', 'Y']  # Les seuls mots d'une lettre en français
    suggestions = {}
    mots = texte.split()
    for mot in mots:
        if len(mot) == 1 and mot not in mots_une_lettre:
            for suggestion in mots_une_lettre:
                if mot not in suggestions:
                    suggestions[mot] = [suggestion]
                else:
                    suggestions[mot].append(suggestion)
    return suggestions


# module détection lettres doublees
def detecter_lettres_doublees(texte):
    """Identifie les lettres doublées improbables dans le texte chiffré."""
    lettres_doublées_improbables = []
    for i in range(len(texte)-1):
        # Vérifie si deux lettres consécutives sont identiques
        if texte[i] == texte[i+1] and texte[i].isalpha():
            if texte[i] not in lettres_doublées_improbables:
                lettres_doublées_improbables.append(texte[i])
    return lettres_doublées_improbables


# module détection mots fréquents
def trouver_mots_frequents(texte, mots_frequents):
    """Identifie les occurrences de mots fréquents dans le texte chiffré."""
    mots_texte = texte.split()
    correspondances = {}
    for mot in mots_texte:
        if mot in mots_frequents:
            if mot in correspondances:
                correspondances[mot] += 1
            else:
                correspondances[mot] = 1
    return correspondances

# module analyse des lettres précédant une apostrophe
def analyser_lettres_apostrophe(texte):
    """Identifie les lettres qui précèdent une apostrophe dans le texte chiffré."""
    lettres_avant_apostrophe = []
    for i in range(len(texte)):
        if texte[i] == "'" and i != 0:  # Assurez-vous que l'apostrophe n'est pas en début de texte
            lettre_avant = texte[i-1]
            if lettre_avant.isalpha():  # Assurez-vous que le caractère avant l'apostrophe est une lettre
                if lettre_avant not in lettres_avant_apostrophe:
                    lettres_avant_apostrophe.append(lettre_avant)
    return lettres_avant_apostrophe



#main
file = "long2.txt"
texte_chiffre = open(file).read()

# Liste hypothétique de mots fréquents en français pour l'exemple
mots_frequents = ["LE", "DE", "UN", "ET", "LES", "À", "DES", "EN", "DU", "QUE"]

frequences_attendues = {
    'A': 8.15, 'N': 7.12,
    'B': 0.97, 'O': 5.28,
    'C': 3.15, 'P': 2.80,
    'D': 3.73, 'Q': 1.21,
    'E': 17.39, 'R': 6.64,
    'F': 1.12, 'S': 8.14,
    'G': 0.97, 'T': 7.22,
    'H': 0.85, 'U': 6.38,
    'I': 7.31, 'V': 1.64,
    'J': 0.45, 'W': 0.03,
    'K': 0.02, 'X': 0.41,
    'L': 5.69, 'Y': 0.28,
    'M': 2.87, 'Z': 0.15
}


# Utilisation des modules
# Utilisation des modules définis précédemment
frequences = calculer_frequences(texte_chiffre)
comparaison = comparer_frequences(frequences, frequences_attendues)
lettres_doublees = detecter_lettres_doublees(texte_chiffre)
mots_une_lettre = identifier_mots_une_lettre(texte_chiffre)
mots_frequents_trouves = trouver_mots_frequents(texte_chiffre, mots_frequents)
lettres_avant_apostrophe_trouvees = analyser_lettres_apostrophe(texte_chiffre)

# Affichage des résultats
print("Fréquences des lettres dans le texte chiffré et comparaison avec les fréquences attendues:", comparaison)
print("Lettres doublées improbables:", lettres_doublees)
print("Suggestions pour mots d'une lettre:", mots_une_lettre)
print("Mots fréquents trouvés:", mots_frequents_trouves)
print("Lettres avant apostrophe trouvées:", lettres_avant_apostrophe_trouvees)