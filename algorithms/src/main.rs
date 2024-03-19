fn main() {
    let mut arr = [64, 34, 25, 12, 22, 11, 90];

    SortingAlgorithms::insertion_sort(&mut arr);
    println!("Sorted array: {:?}", arr);

    let len = arr.len();
    SortingAlgorithms::merge_sort(&mut arr, 0, len - 1);
    println!("Sorted array: {:?}", arr);

    SortingAlgorithms::bubble_sort(&mut arr);
    println!("Sorted array: {:?}", arr);
}

struct SortingAlgorithms;

// create sorting algorithms class
impl SortingAlgorithms {
    // insertion sort
    fn insertion_sort(arr: &mut [i32]) {
        let n = arr.len();
        for i in 1..n {
            let mut j = i;
            while j > 0 && arr[j - 1] > arr[j] {
                arr.swap(j - 1, j);
                j -= 1;
            }
        }
    }

    // merge
    fn merge(arr: &mut [i32], l: usize, m: usize, r: usize) {
        let n1 = m - l + 1;
        let n2 = r - m;

        let mut left = vec![0; n1];
        let mut right = vec![0; n2];

        for i in 0..n1 {
            left[i] = arr[l + i];
        }
        for i in 0..n2 {
            right[i] = arr[m + 1 + i];
        }

        let mut i = 0;
        let mut j = 0;
        let mut k = l;

        while i < n1 && j < n2 {
            if left[i] <= right[j] {
                arr[k] = left[i];
                i += 1;
            } else {
                arr[k] = right[j];
                j += 1;
            }
            k += 1;
        }

        while i < n1 {
            arr[k] = left[i];
            i += 1;
            k += 1;
        }

        while j < n2 {
            arr[k] = right[j];
            j += 1;
            k += 1;
        }
    }

    // merge sort
    fn merge_sort(arr: &mut [i32], l: usize, r: usize) {
        if l < r {
            let m = l + (r - l) / 2;
            SortingAlgorithms::merge_sort(arr, l, m);
            SortingAlgorithms::merge_sort(arr, m + 1, r);
            SortingAlgorithms::merge(arr, l, m, r);
        }
    }

    // bubble sort
    fn bubble_sort(arr: &mut [i32]) {
        let n = arr.len();
        for i in 0..n {
            for j in 0..n - i - 1 {
                if arr[j] > arr[j + 1] {
                    arr.swap(j, j + 1);
                }
            }
        }
    }
}
