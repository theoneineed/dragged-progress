program factorial_calc
    implicit none
    integer :: n
    n=5
    print*,'value of n before factorial calculation is: ', n
    print*, 'the factorial is ', factorial(n)
    print*,'the value of n after factorial calculation is: ', n

    print*,'the value of n did not change after the factorial calculation as it was passed by value.'

    print*,'Compare it to:'
    print*,'value of n before summation calculation is: ', n
    print*,'value of summation is: ', summation(n)
    print*,'value of n after summation calculation is: ', n

    print*,'as expected, the value of n changed after calling by reference compared &
     &to before when it didnot change while calling by value'


contains
    function factorial(n) result(fac)
        implicit none
        integer, value :: n
        !the use of the term value here implies, n is being passed by value
        !and not by reference which means, any operation we carry oit on n, the original
        !value of n outside the function will not change
        integer :: fac

        fac = 1
        do while (n > 1)
            fac = fac*n
            n = n - 1
        end do
    end function

    integer function summation(n) result(addition)
    implicit none
    integer, intent(inout) :: n

    addition = 0
    do while (n>0)
        addition = addition + n
        n=n-1
    end do
    end function
end program factorial_calc