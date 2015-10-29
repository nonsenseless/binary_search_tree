# binary_search_tree
An implementation of a binary search tree constructor along with Depth-First and Breadth-First search functions. See project 1 at http://www.theodinproject.com/ruby-programming/data-structures-and-algorithms?ref=lnav

10/27 - Created a method to take a sorted array of values and create a balanced binary search tree. In order to refactor the method to accept unsorted data, I will change the build method to start from the beginning and move forward. It'll be uneven, but degradation of the tree seems to be an inherent issue with binary search trees, though it can be offset with balanced search trees or other data structures. On average, given N random elements, the performance of a binary search tree will be about 2(ln N) compares.

10/28 - Added depth-first search (recursive and non) and breadth-first search. See notes below for possible refactorings.

Lessons Learned:
1) Always be mindful of what your method is returning and to where. Pay particular attention to this when first setting up your instance variables and initialization methods.


Possible Refactorings
1) Fix add_left_child and add_right_child
2) Create subclasses of Crawler for each type of search.
