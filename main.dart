void main() {
  List<int> list = [9, 6, 5, 11, 43, 67, 1];
  // List<int> list = [9, 8, 7, 6, 5, 4, 3, 2, 1];
  print(SortingAlgorithms().bubbleSort(list));
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
