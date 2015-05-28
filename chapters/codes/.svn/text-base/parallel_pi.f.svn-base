!****************************************************************
!   pi_hpf.hpf - compute pi by integr. f(x) = 4/(1 + x**2) from 0 to 1
!   This is an Adaptor 7.0 compatible HPF program
!****************************************************************
PROGRAM pi_hpf

IMPLICIT NONE
DOUBLE PRECISION     PI25DT, pi, h, sum, x
REAL                 t(2), t_start, t_end
INTEGER              n, i, numprocs
PARAMETER( PI25DT = 3.141592653589793238462643D0 )

!HPF$   PROCESSORS, DIMENSION(NUMBER_OF_PROCESSORS()) :: all_procs
!HPF$   PROCESSORS :: one_proc

!ADP$   REPLICATED ONTO all_procs :: n
!ADP$   SINGLE :: t_start ,t_end, t, PI25DT, numprocs, pi

INTERFACE
EXTRINSIC(F77_SERIAL) FUNCTION ETIME(t)
REAL :: ETIME,t(2)
END FUNCTION ETIME

EXTRINSIC(F77_SERIAL) SUBROUTINE PrintOut()
END SUBROUTINE PrintOut
END INTERFACE

numprocs = NUMBER_OF_PROCESSORS()
WRITE(*,*) "HPF initialized with ", numprocs, " processors"

DO

WRITE(*,*) "Enter the number of intervals (0 to quit)"
CALL PrintOut()
READ(*,*) n
IF ( n<=0 ) EXIT

t_start = ETIME(t)

h = 1.0d0/n
sum  = 0.0d0

!HPF$      INDEPENDENT, NEW(i,x), REDUCTION(sum)
DO i = 1, n
x = h * (DBLE(i) - 0.5d0)
sum = sum + 4.d0/(1.d0 + x*x)
END DO

pi = h * sum

WRITE(*,*) "Approximation for pi is ", pi
WRITE(*,*) "The error is ", abs(pi - PI25DT)

t_end = ETIME(t)
WRITE(*,*) "Elapsed time is", t_end-t_start
CALL PrintOut()

END DO

END PROGRAM pi_hpf