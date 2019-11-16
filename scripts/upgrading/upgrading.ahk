global bruenor := [275, 900]
global celeste := [415, 900]
global nayeli := [555, 900]
global jarlaxle := [695, 900]
global calliope := [835, 900]
global asharra := [975, 900]
global leftChamps := [bruenor, celeste, nayeli, jarlaxle, calliope, asharra]

global minsc := [645, 900]
global delina := [785, 900]
global makos := [925, 900]
global tyril := [1065, 900]
global jamilah := [1205, 900]
global arkhan := [1345, 900]
global rightChamps := [minsc, tyril, delina, makos, jamilah, arkhan]


^!r::Reload  ; Ctrl-Alt-R restarts the script

/::  ; "/" displays a pop-up with the mouse position and color
{
  MouseGetPos, xpos, ypos
  PixelGetColor, testedColor, xpos + 10, ypos
  MsgBox, Cursor: X %xpos%, Y %ypos% | Color: %testedColor%
  return
}

