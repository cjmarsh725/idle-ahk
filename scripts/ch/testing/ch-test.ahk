#SingleInstance, force

global clickRatios := [0.729, 0.624]


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