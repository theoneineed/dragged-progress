module quad_mod
implicit none

private

public :: quad
contains

function quad(f, a, b) result(q_f)
    use, intrinsic :: iso_fortran_env, only : DP => REAL64
    use :: quad_func_interface_mod
    implicit none
    procedure(quad_func_t) :: f
    real(kind=DP), intent(in) :: a, b
    real(kind=DP) :: q_f
    q_f = 0.5_DP*(f(b) + f(a))*(b - a)
end function quad
end module quad_mod