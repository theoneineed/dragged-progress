!The open statement takes a lot of arguments:

!    unit, the unit number to use, or newunit to assign a new unit number;
!    file, the file name to use;
!    access, this can be sequential, direct or stream;
!    action, this can be write, readwrite or read;
!    status, this can be new, old, replace or scratch;
!    form, this can be formatted or unformatted;
!    position, this is the position to start writing, it can be rewind or append;
!    iostat, represents the exit status of the statement, non-zero if there were issues;
!    iomsg, this is the error message in case something went wrong.

!It is good practice to always use iostat to verify that I/O operations succeeded

program newunit_test
    use, intrinsic :: iso_fortran_env, only : error_unit
    implicit none
    integer :: unit_nr, istat
    character(len=1024) :: msg

    open (newunit=unit_nr, file='text.txt', access='sequential', action='write', &
          status='new', form='formatted', iostat=istat, iomsg=msg)
    if (istat /= 0) then
        write (unit=error_unit, fmt='(2A)') 'error: ', trim(msg)
        stop 1
     end if
     write (unit=unit_nr, fmt='(A)') 'hello world!'
     close (unit=unit_nr)
end program newunit_test