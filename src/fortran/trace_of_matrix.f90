program trace_of_matrix

    implicit none
    integer :: n
    integer, parameter :: ROWS = 3, COLS = 3
    real, dimension(ROWS,COLS) :: A
    A = reshape([(n**2 - 2, n = 1, 10)],[3,3])
    ! I could have used shape(A) which is also [3,3]
    do n = 1, size(A, 1)
        print *, A(n, :)
    end do

    print*, 'trace of above matrix is:', trace(A)

contains
    real function trace(matrix)
        use, intrinsic :: iso_fortran_env, only : error_unit
        implicit none
        real, dimension(:, :), intent(in) :: matrix
        integer :: i
        
        !The function’s argument is an array of rank 2, but unspecified size (dimension(:, :)), 
        !however, the information about the shape of the array is available when the 
        !function is executed. The size and shape intrinsic functions will return the values 
        !corresponding to the array in the calling context.
        
        if (size(matrix, 1) /= size(matrix, 2)) then
            write (unit=error_unit, fmt='(A)') &
                'error: can not compute trace of a non-square matrix'
            stop 1
        end if
        trace = 0.0
        do i = 1, size(matrix, 1)
            trace = trace + matrix(i, i)
        end do
    end function trace
end program trace_of_matrix