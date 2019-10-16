def replace_word(w1, w2, ch):
    """Gestion des chaines de caractères
    - realiser la fonction 'remplacer_mot(mot1, mot2, ch)' qui remplace la mot mot1
    dans la chaine ch par le mot mot2
    - mot1, mot 2 et ch étant des chaines de caractères passées en paramètres

    proposer une solution sans utiliser la fonction "replace"
    Exemple d'exécution:
    >> remplacer_mot('com', 'cam', 'coméra')
    >> 'caméra'
    """
    pattern_len = len(w1)
    for i in range(len(ch)-1):
        if ch[i: i+pattern_len] == w1:
            ch = ch[:i] + w2 + ch[i+pattern_len:]
    return ch

st = 'coméra'
print(st, '\n', replace_word.__doc__)
st = replace_word('com', 'caaaam', st)
print(st)