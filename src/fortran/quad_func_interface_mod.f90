module quad_func_interface_mod

    interface
        function quad_func_t(x) result(f)
            use, intrinsic :: iso_fortran_env, only : DP => REAL64
            implicit none
            real(kind=DP), value :: x
            real(kind=DP) :: f
        end function quad_func_t
    end interface

end module quad_func_interface_mod