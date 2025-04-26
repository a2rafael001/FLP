from itertools import permutations, combinations, product

# 1. Нерекурсивное размещение без повторений
def placement_non_recursive(alphabet, k, file):
    for p in permutations(alphabet, k):
        file.write(''.join(p) + '\n')

# 2. Нерекурсивное построение всех подмножеств
def subset_non_recursive(alphabet, file):
    n = len(alphabet)
    for i in range(2 ** n):
        subset = [alphabet[j] for j in range(n) if (i & (1 << j))]
        file.write(''.join(subset) + '\n')

# 3. Нерекурсивно слова длины 5 с 2 буквами 'a'
def words_2a_unique_non_recursive(alphabet, file):
    letters = alphabet.copy()
    letters.remove('a')
    for comb in combinations(letters, 3):
        word = ['a', 'a'] + list(comb)
        for p in set(permutations(word)):
            file.write(''.join(p) + '\n')

# 4. Нерекурсивно слова длины 7 с особым повторением
def words_special_non_recursive(alphabet, file):
    for l1 in alphabet:
        for l2 in alphabet:
            if l1 != l2:
                remaining = [l for l in alphabet if l != l1 and l != l2]
                if len(remaining) >= 2:
                    for r in combinations(remaining, 2):
                        base = [l1]*3 + [l2]*2 + list(r)
                        for p in set(permutations(base)):
                            file.write(''.join(p) + '\n')

# --- MAIN ---

alphabet = ['a', 'b', 'c', 'd', 'e']

with open('non_recursive_output.txt', 'w') as f:
    f.write('Placements:\n')
    placement_non_recursive(alphabet, 3, f)

    f.write('\nSubsets:\n')
    subset_non_recursive(alphabet, f)

    f.write('\nWords 5 with 2 a:\n')
    words_2a_unique_non_recursive(alphabet, f)

    f.write('\nWords 7 special:\n')
    words_special_non_recursive(alphabet, f)
