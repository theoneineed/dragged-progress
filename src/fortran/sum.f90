program sum
    implicit none
    !compute the sum of two numbers input by the user
    real :: x,y, answer
    print *,'Enter two numbers'
    read *,x
    read *,y
    answer = x+y
    
    print *,'The total is', answer
    end program sum
