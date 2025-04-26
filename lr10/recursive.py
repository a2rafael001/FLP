from itertools import permutations

# 1. Рекурсивное размещение без повторений
def placement_recursive(alphabet, k, current, used, file):
    if len(current) == k:
        file.write(''.join(current) + '\n')
        return
    for i in range(len(alphabet)):
        if not used[i]:
            used[i] = True
            placement_recursive(alphabet, k, current + [alphabet[i]], used, file)
            used[i] = False

# 2. Рекурсивное построение всех подмножеств
def subset_recursive(alphabet, index, current, file):
    if index == len(alphabet):
        file.write(''.join(current) + '\n')
        return
    subset_recursive(alphabet, index + 1, current, file)
    subset_recursive(alphabet, index + 1, current + [alphabet[index]], file)

# 3. Рекурсивно слова длины 5 с 2 буквами 'a'
def words_2a_unique_recursive(alphabet, current, count_a, file):
    if len(current) == 5:
        if count_a == 2:
            file.write(''.join(current) + '\n')
        return
    for i in range(len(alphabet)):
        if alphabet[i] not in current or alphabet[i] == 'a':
            words_2a_unique_recursive(alphabet, current + [alphabet[i]], count_a + (1 if alphabet[i] == 'a' else 0), file)

# 4. Рекурсивно слова длины 7 с особым повторением
def words_special_recursive(alphabet, current, counts, file):
    if len(current) == 7:
        values = list(counts.values())
        if sorted(values) == [1,1,2,3]:
            file.write(''.join(current) + '\n')
        return
    for letter in alphabet:
        new_counts = counts.copy()
        new_counts[letter] = new_counts.get(letter, 0) + 1
        words_special_recursive(alphabet, current + [letter], new_counts, file)

# --- MAIN ---

alphabet = ['a', 'b', 'c', 'd', 'e']

with open('recursive_output.txt', 'w') as f:
    f.write('Placements:\n')
    placement_recursive(alphabet, 3, [], [False]*len(alphabet), f)

    f.write('\nSubsets:\n')
    subset_recursive(alphabet, 0, [], f)

    f.write('\nWords 5 with 2 a:\n')
    words_2a_unique_recursive(alphabet, [], 0, f)

    f.write('\nWords 7 special:\n')
    words_special_recursive(alphabet, [], {}, f)
