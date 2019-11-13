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
For index, familiar in familiars
  MouseMove, familiar[1], familiar[2]
  xpos := familiar[1]
  ypos := familiar[2]
  MsgBox, The cursor is at X %xpos%, Y %ypos%
  Click
  Sleep 100
return