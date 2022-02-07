program subarrays
    implicit none
    integer :: i
    integer, dimension(10) :: A = [ (i, i = 1, 10) ]
    character(len=10), parameter :: FMT = '(10I3)'
    ! FMT here is the fortran in which we want elements to print. There are various
    !formats available like (I5,F10.2), (4I5, 5E14.7, 8F5.0)
    !Look up fortran formats online to learn more about this topic

    print FMT, A
    print FMT, A(4:7)
    print FMT, A(:7)
    print FMT, A(4:)
    print FMT, A(4:7:2)
    print FMT, A(4::2)
    print FMT, A(:7:2)
    print FMT, A(7:4:-1)

    !1  2  3  4  5  6  7  8  9 10
    !4  5  6  7
    !1  2  3  4  5  6  7
    !4  5  6  7  8  9 10
    !4  6
    !4  6  8 10
    !1  3  5  7
    !7  6  5  4
    !is what we get as output
end program subarrays