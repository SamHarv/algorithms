void main() {
  List<List<int>> matrixA = [
    [2, 4, 9],
    [8, 1, 4],
    [10, 5, 6]
  ];
  List<List<int>> matrixB = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ];
  // List<int> list = [9, 8, 7, 6, 5, 4, 3, 2, 1];
  List<List<int>> matrixC =
      MatrixMultiplication().matrixMultiplication(matrixA, matrixB);
  print(matrixC);
}

class SortingAlgorithms {
  // Insertion sort O(n^2)
  List<int> insertionSort(List<int> list) {
    for (int i = 1; i < list.length; i++) {
      int key = list[i];
      int j = i - 1;
      while (j >= 0 && list[j] > key) {
        list[j + 1] = list[j];
        j = j - 1;
      }
      list[j + 1] = key;
    }
    return list;
  }

  // Merge O(n)
  List<int> merge(List<int> left, List<int> right) {
    List<int> result = [];
    int i = 0;
    int j = 0;
    while (i < left.length && j < right.length) {
      if (left[i] < right[j]) {
        result.add(left[i]);
        i++;
      } else {
        result.add(right[j]);
        j++;
      }
    }
    while (i < left.length) {
      result.add(left[i]);
      i++;
    }
    while (j < right.length) {
      result.add(right[j]);
      j++;
    }
    return result;
  }

  // Merge sort O(n log n)
  List<int> mergeSort(List<int> list) {
    if (list.length <= 1) {
      // Base case: list is already sorted
      return list;
    }
    int middle = (list.length / 2).floor();
    List<int> left = list.sublist(0, middle);
    List<int> right = list.sublist(middle);
    return merge(mergeSort(left), mergeSort(right));
  }

  // Bubble sort O(n^2)
  List<int> bubbleSort(List<int> list) {
    for (int i = 0; i < list.length; i++) {
      for (int j = list.length - 1; j > i; j--) {
        if (list[j] < list[j - 1]) {
          int temp = list[j];
          list[j] = list[j - 1];
          list[j - 1] = temp;
        }
        print("Inner loop: $list");
      }
      print("Outer loop: $list");
    }
    return list;
  }
}

class MatrixMultiplication {
  List<List<int>> matrixMultiplication(List<List<int>> a, List<List<int>> b) {
    int aRows = a.length;
    int aCols = a[0].length;
    int bRows = b.length;
    int bCols = b[0].length;
    if (aCols != bRows) {
      throw Exception("Incompatible matrices");
    }
    List<List<int>> result = List.generate(aRows, (i) => List.filled(bCols, 0));
    for (int i = 0; i < aRows; i++) {
      for (int j = 0; j < bCols; j++) {
        for (int k = 0; k < aCols; k++) {
          result[i][j] += a[i][k] * b[k][j];
        }
      }
    }
    return result;
  }
}

// Stack

// void main() {
//   final stack = Stack();

//   void reversedList(List list) {
//     for (final element in list) {
//       stack.push(element);
//     }
//     while (stack.isNotEmpty) {
//       print(stack.pop());
//     }
//   }

// //   reversedList([1, 2, 3, 4, 5]);

//   bool areParenthesesBalanced(String text) {
//     for (int i = 0; i < text.length; i++) {
//       final char = text[i];
//       if (char == '(') {
//         stack.push(char);
//       } else if (char == ')') {
//         if (stack.isEmpty) {
//           return false;
//         } else {
//           stack.pop();
//         }
//       }
//     }
//     return stack.isEmpty;
//   }

//   print(areParenthesesBalanced('(Hello)'));

// //   stack.push(1);
// //   stack.push(2);
// //   stack.push(3);
// //   stack.push(4);
// //   print(stack);

// //   final element = stack.pop();
// //   print('Popped: $element');
// }

class Stack<E> {
  Stack() : _storage = <E>[];
  final List<E> _storage;

  @override
  String toString() {
    return '--- Top ---\n'
        '${_storage.reversed.join('\n')}'
        '\n--------------';
  }

  void push(E element) => _storage.add(element);

  E pop() => _storage.removeLast();

  E get peek => _storage.last;

  bool get isEmpty => _storage.isEmpty;

  bool get isNotEmpty => !isEmpty;
}
