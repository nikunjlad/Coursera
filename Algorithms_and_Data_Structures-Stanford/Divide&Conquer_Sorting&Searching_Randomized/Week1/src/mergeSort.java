
import java.util.Arrays;

public class mergeSort {

    public static void merge_sort(int[] arr)
    {
        int arr_size = arr.length;
        System.out.printf("\nSorting %s", Arrays.toString(arr));

        if(arr.length > 1)
        {
            int[] left_arr = Arrays.copyOfRange(arr, 0, arr_size / 2);
            int[] right_arr = Arrays.copyOfRange(arr, arr_size / 2, arr_size);

            merge_sort(left_arr);
            merge_sort(right_arr);

            int i = 0;  // left half is sorted, same goes to right half
            int j = 0;
            int k = 0;

            while(i < left_arr.length && j < right_arr.length)
            {
                if(left_arr[i] < right_arr[j]) {
                    arr[k] = left_arr[i];
                    i += 1;
                }
                else
                {
                    arr[k] = right_arr[j];
                    j += 1;
                }
                k += 1;
            }

            while(i < left_arr.length)
            {
                arr[k] = left_arr[i];
                i += 1;
                k += 1;
            }

            while(j < right_arr.length)
            {
                arr[k] = right_arr[j];
                j += 1;
                k += 1;
            }

            System.out.printf("\nMerging %s", Arrays.toString(arr));

        }


    }


    public static void main(String[] args)
    {
        int[] arr = {5,4,1,8,7,2,6,3};
        merge_sort(arr);
        System.out.println("\nSorted array: " + Arrays.toString(arr));
    }
}
