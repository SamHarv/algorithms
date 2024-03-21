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

    # Bubble sort O(n^2)
    def bubble_sort(self, numbers):
        for i in range(len(numbers)):
            for j in range(len(numbers) - 1):
                if numbers[j] > numbers[j + 1]:
                    numbers[j] = numbers[j + 1]
                    numbers[j + 1] = numbers[j]
        return numbers


class MatrixMultiplication:
    def __init__(self):
        pass
    
    # Matrix multiplication O(n^3)
    def matrix_multiplication(self, A, B):
        result = [[0 for _ in range(len(A))] for _ in range(len(B[0]))]
        for i in range(len(A)):
            for j in range(len(B[0])):
                for k in range(len(B)):
                    result[i][j] += A[i][k] * B[k][j]
        return result
            
if __name__ == "__main__":
    main()