#SingleInstance, force

global fam1 := [1254, 512]
global fam2 := [1171, 594]
global fam3 := [1088, 512]
global fam4 := [185, 890]
global familiars := [fam1, fam2, fam3, fam4]


^+r::
MouseGetPos, xpos, ypos
MsgBox, The cursor is at X %xpos%, Y %ypos%
return

/::
Send, {f down}
For index, familiar in familiars
  Sleep 100
  MouseMove, familiar[1], familiar[2]
  Click
Send, {f up}
return