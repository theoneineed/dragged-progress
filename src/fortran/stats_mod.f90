module stats_mod
    implicit none

    private

    type, public:: stats_t
    real :: sum, sum2
    integer :: n
    end type stats_t

    public :: init_stats, add_stats_value, mean_stats
    !Since the subroutine validate is not being made public, it cannot be accessed from outside
    !comapared to other ones like init_stats, or, add_stats_value

contains

    subroutine init_stats(stats)
        implicit none
        type(stats_t), intent(out) :: stats

        stats = stats_t(0.0, 0.0, 0)
    end subroutine init_stats
    
    subroutine add_stats_value(stats, value)
        implicit none
        type(stats_t), intent(inout) :: stats
        real, value :: value

        stats%sum = stats%sum + value
        stats%sum2 = stats%sum2 + value **2
        stats%n = stats%n + 1
    end subroutine add_stats_value

    function mean_stats(stats) result(mean_value)
        use, intrinsic :: iso_fortran_env, only : error_unit
        implicit none
        type(stats_t), intent(in) :: stats
        real:: mean_value

        if(stats%n == 0) then
            write(unit = error_unit, fmt = '(A)') 'error: not enough data'
            stop 1
        end if
        
        associate (sum => stats%sum , n => stats%n)
            mean_value = sum / n
        end associate
    end function mean_stats

    subroutine validate(stats, need_stddev)
        use, intrinsic :: iso_fortran_env, only : error_unit
        implicit none
        type(stats_t), intent(in) :: stats
        logical, optional, value :: need_stddev

        if(stats%n < 1) then
            write(unit = error_unit, fmt = '(A)') 'error: not enough data'
            stop 1
        else if (present (need_stddev)) then
            if(need_stddev .and. stats%n < 2) then
                write(unit = error_unit, fmt = '(A)') 'error: not enough data'
                stop 1
            end if
        end if
    end subroutine validate



end module stats_mod