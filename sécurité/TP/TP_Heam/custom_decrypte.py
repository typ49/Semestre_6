# custom_decrypter.py
def lire_fichier(chemin_fichier):
    with open(chemin_fichier, 'r', encoding='utf-8') as fichier:
        return fichier.read()

def lire_fichier_alphabet(chemin_fichier='alphabet.txt'):
    correspondances = {}
    with open(chemin_fichier, 'r', encoding='utf-8') as fichier:
        for ligne in fichier:
            parts = ligne.strip().split('=')
            if len(parts) == 2:
                correspondances[parts[0]] = parts[1]
    return correspondances

def substituer_lettres(texte, correspondances):
    texte_dechiffre = ""
    for lettre in texte:
        if lettre.upper() in correspondances:
            lettre_dechiffree = correspondances[lettre.upper()]
            texte_dechiffre += lettre_dechiffree.lower() if lettre.islower() else lettre_dechiffree.upper()
        else:
            texte_dechiffre += lettre
    return texte_dechiffre

def main():
    chemin_fichier = "./long2.txt"  # Remplacez par votre chemin de fichier
    texte_chiffre = lire_fichier(chemin_fichier)
    correspondances = lire_fichier_alphabet()
    
    texte_dechiffre = substituer_lettres(texte_chiffre, correspondances)
    print(texte_dechiffre)

if __name__ == "__main__":
    main()
