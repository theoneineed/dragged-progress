program ifelse
    integer :: x
    print*,'input an integer'
    Read *,x
    if (x < 0) then
        print*,x,'is negative'
    else if (x > 0) then
        print*,x, 'is positive'
    else
        print*,x,'is zero'
    end if
        
end program ifelse