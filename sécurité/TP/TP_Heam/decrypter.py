def lire_fichier(chemin_fichier):
    with open(chemin_fichier, 'r', encoding='utf-8') as fichier:
        return fichier.read()

def calculer_frequences(texte):
    frequences = {}
    total_lettres = 0
    for lettre in texte:
        if lettre.isalpha():
            lettre = lettre.upper()  # Utiliser des majuscules pour la cohérence avec les fréquences fournies
            frequences[lettre] = frequences.get(lettre, 0) + 1
            total_lettres += 1
    for lettre in frequences:
        frequences[lettre] = (frequences[lettre] / total_lettres) * 100  # Pourcentage
    return frequences

def trouver_correspondances(frequences_chiffrees, frequences_reference):
    correspondances = {}
    lettres_chiffrees_triees = sorted(frequences_chiffrees, key=frequences_chiffrees.get, reverse=True)
    lettres_reference_triees = sorted(frequences_reference, key=frequences_reference.get, reverse=True)
    
    for lettre_chiffree, lettre_reference in zip(lettres_chiffrees_triees, lettres_reference_triees):
        correspondances[lettre_chiffree] = lettre_reference
    return correspondances

def substituer_lettres(texte, correspondances):
    texte_dechiffre = ""
    for lettre in texte:
        lettre_maj = lettre.upper()
        if lettre_maj in correspondances:
            lettre_dechiffree = correspondances[lettre_maj]
            if lettre.islower():
                lettre_dechiffree = lettre_dechiffree.lower()
            texte_dechiffre += lettre_dechiffree
        else:
            texte_dechiffre += lettre
    return texte_dechiffre

def ecrire_alphabet_dans_fichier(correspondances):
    with open('alphabet.txt', 'w', encoding='utf-8') as fichier:
        for lettre_chiffree, lettre_dechiffree in correspondances.items():
            fichier.write(f"{lettre_chiffree}={lettre_dechiffree}\n")

# Fréquences de référence pour la langue française
frequences_reference = {
    'A': 8.15, 'N': 7.12, 'B': 0.97, 'O': 5.28, 'C': 3.15, 'P': 2.80,
    'D': 3.73, 'Q': 1.21, 'E': 17.39, 'R': 6.64, 'F': 1.12, 'S': 8.14,
    'G': 0.97, 'T': 7.22, 'H': 0.85, 'U': 6.38, 'I': 7.31, 'V': 1.64,
    'J': 0.45, 'W': 0.03, 'K': 0.02, 'X': 0.41, 'L': 5.69, 'Y': 0.28,
    'M': 2.87, 'Z': 0.15
}

def main():
    chemin_fichier = "./long2.txt"  # Assurez-vous que le chemin est correct
    texte_chiffre = lire_fichier(chemin_fichier)
    frequences_chiffrees = calculer_frequences(texte_chiffre)
    correspondances = trouver_correspondances(frequences_chiffrees, frequences_reference)
    texte_dechiffre = substituer_lettres(texte_chiffre, correspondances)

    print("Résultat du déchiffrement:")
    print(texte_dechiffre)

    # Écrire l'alphabet de substitution dans un fichier
    ecrire_alphabet_dans_fichier(correspondances)

if __name__ == "__main__":
    main()
