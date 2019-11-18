#SingleInstance, force
#MaxThreadsPerHotkey, 2

global toggle := true
global title := "Clicker Heroes"
global clickRatios := [0.74, 0.62]


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
    x := clickRatios[1] * width
    y := clickRatios[2] * height
    MouseMove, x, y
    Click
    Sleep, 10
  }
}


^+r::
{
  WinGetActiveStats, title, width, height, xwin, ywin
  MouseGetPos, x, y
  xratio := 1 - ((width - x) / width)
  yratio := 1 - ((height - y) / height)
  MsgBox, %title% `, %xratio% `, %yratio%
  return
}

^!r::Reload  ; Ctrl-Alt-R restarts the script