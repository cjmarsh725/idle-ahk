#SingleInstance, force
#MaxThreadsPerHotkey, 2

global toggle := true
global title := "Clicker Heroes"
global clickRatios := [0.74, 0.62]
global levelRatios := [0.79, 0.104]
global levelBkg := 0xBCBA72

/::
{
  toggle := !toggle
  Loop
  {
    if (toggle)
      return
    WinGetActiveStats, wintitle, width, height, xwin, ywin
    if (wintitle != title)
      return

    ; levelx := levelRatios[1] * width
    ; levely := levelRatios[2] * height
    ; MouseMove, levelx, levely
    ; Click

    x := clickRatios[1] * width
    y := clickRatios[2] * height
    MouseMove, x, y
    Click
  }
}


^+r::
{
  WinGetActiveStats, title, width, height, xwin, ywin
  MouseGetPos, x, y
  xratio := 1 - ((width - x) / width)
  yratio := 1 - ((height - y) / height)
  PixelGetColor, testedColor, x, y
  MsgBox, %title%`, %xratio%`, %yratio%`, %testedColor%
  return
}

^!r::Reload  ; Ctrl-Alt-R restarts the script