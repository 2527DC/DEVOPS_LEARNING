| Algorithm          | Type                     | Time Complexity (Avg) | Space    | Stable | Notes                                        |
| ------------------ | ------------------------ | --------------------- | -------- | ------ | -------------------------------------------- |
| **Bubble Sort**    | Comparison               | O(n²)                 | O(1)     | Yes    | Simple, educational, rarely used in practice |
| **Selection Sort** | Comparison               | O(n²)                 | O(1)     | No     | Finds min/max repeatedly                     |
| **Insertion Sort** | Comparison               | O(n²)                 | O(1)     | Yes    | Good for **nearly sorted arrays**            |
| **Merge Sort**     | Divide & Conquer         | O(n log n)            | O(n)     | Yes    | Stable, predictable                          |
| **Quick Sort**     | Divide & Conquer         | O(n log n) avg        | O(log n) | No     | In-place, fast in practice                   |
| **Heap Sort**      | Comparison / Heap        | O(n log n)            | O(1)     | No     | Uses max/min heap                            |
| **Counting Sort**  | Non-comparison           | O(n+k)                | O(k)     | Yes    | For **integers in small range**              |
| **Radix Sort**     | Non-comparison           | O(n\*k)               | O(n+k)   | Yes    | Sorts numbers **digit by digit**             |
| **Timsort**        | Hybrid (Insertion+Merge) | O(n log n)            | O(n)     | Yes    | Used in Python & JS `.sort()` internally     |
