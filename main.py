def main():
    numbers = [12, 45, 1, 6, 9, 8]
    print(SortingAlgoriths().insertion_sort(numbers))

class SortingAlgoriths:
    def __init__(self):
        pass
    
    # Insertion sort O(n^2)
    def insertion_sort(self, numbers):
        for i in range(1, len(numbers)):
            key = numbers[i]
            j = i - 1
            while j >= 0 and numbers[j] > key:
                numbers[j + 1] = numbers[j]
                j -= 1
            numbers[j + 1] = key
        return numbers

    # Merge O(n)
    def merge(self, left, right):
        result = []
        i = j = 0
        while i < len(left) and j < len(right):
            if left[i] < right[j]:
                result.append(left[i])
                i += 1
            else:
                result.append(right[j])
                j += 1
        result += left[i:]
        result += right[j:]
        return result
    
    # Merge sort O(nlogn)
    def merge_sort(self, numbers):
        if len(numbers) <= 1:
            return numbers
        mid = len(numbers) // 2
        left = self.merge_sort(numbers[:mid])
        right = self.merge_sort(numbers[mid:])
        return self.merge(left, right)
            
if __name__ == "__main__":
    main()