"""
Created by -
@author nikunj on 16/6/18

"""


# Merge Sort algorithm

# recursive calls
def merge_sort(unsorted):
    if len(unsorted) == 0:  #
        return None
    elif len(unsorted) == 1:
        return unsorted
    elif len(unsorted) == 2:
        if unsorted[0] > unsorted[1]:
            temp = [unsorted[1], unsorted[0]]
        else:
            temp = [unsorted[0], unsorted[1]]
        return temp
    else:
        len_of_unsorted = len(unsorted)
        midway = int(len_of_unsorted / 2)

        left_sublist = unsorted[0:midway]
        right_sublist = unsorted[midway:]

        left_sorted = merge_sort(left_sublist)
        right_sorted = merge_sort(right_sublist)

        i = 0
        j = 0
        final_sorted = list()
        while i < len(left_sorted) and j < len(right_sorted):
            if left_sorted[i] < right_sorted[j]:
                final_sorted.append(left_sorted[i])
                i += 1
            elif left_sorted[i] > right_sorted[j]:
                final_sorted.append(right_sorted[j])
                j += 1

        while i < len(left_sorted):
            final_sorted.append(left_sorted[i])
            i += 1

        while j < len(right_sorted):
            final_sorted.append(right_sorted[j])
            j += 1

        return final_sorted


# define input array
to_be_sorted = [5,1,4]
merged = merge_sort(to_be_sorted)
print(merged)