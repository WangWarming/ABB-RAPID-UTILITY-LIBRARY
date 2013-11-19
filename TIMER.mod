%%%
  VERSION:1
  LANGUAGE:ENGLISH
%%%

MODULE TIMER(VIEWONLY)

  !*****************************************************
  ! Module Name: TIMER
  ! Version:     0.1
  ! Description: A simple timer with basic functionality
  ! Date:        2013-11-18
  ! Author:      <rob@ernell.se>
  ! License:     Apache License V2.0
  !*****************************************************

  LOCAL VAR clock clTimer;
  LOCAL PERS num nTimer:=0;

  !*****************************************************
  ! Start the timer
  !*****************************************************
  PROC TimerStart()
    nTimer:=0;
    ClkReset clTimer;
    ClkStart clTimer;
  ENDPROC

  !*****************************************************
  ! Resume the timer
  !*****************************************************
  PROC TimerResume()
    ClkStart clTimer;
  ENDPROC

  !*****************************************************
  ! Stop the timer, save the value
  !*****************************************************
  PROC TimerStop()
    ClkStop clTimer;
    nTimer:=ClkRead(clTimer);
  ENDPROC
  
  !*****************************************************
  ! Return the timervalue
  !*****************************************************
  FUNC num GetTimer()
    RETURN nTimer;
  ENDFUNC

  !*****************************************************
  ! Print timer value
  ! Examples:
  !    TimerPrint;
  !      Timer: 0.235
  !    TimerPrint\row_number:=5;
  !      5. Timer: 4.743
  !*****************************************************
  PROC TimerPrint(\num row_number)

    VAR string stMessage;

    IF Present(row_number) THEN
      stMessage:=NumToStr(row_number,0)+". Timer: "+NumToStr(GetTimer(),3);
      TPWrite stMessage;
    ELSE
      TPWrite "Timer: "\Num:=GetTimer();
    ENDIF
  ENDPROC
ENDMODULE
