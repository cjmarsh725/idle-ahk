#SingleInstance, force

global bruenor := [285, 900]
global celeste := [420, 900]
global nayeli := [560, 900]
global jarlaxle := [700, 900]
global calliope := [840, 900]
global asharra := [985, 900]
global leftChamps := [bruenor, celeste, nayeli, jarlaxle, calliope, asharra]

global minsc := [645, 900]
global delina := [785, 900]
global makos := [925, 900]
global tyril := [1065, 900]
global jamilah := [1205, 900]
global arkhan := [1345, 900]
global rightChamps := [minsc, tyril, delina, makos, jamilah, arkhan]

global blue := 0xC17E46
global grey := 0x7A7A7A
global green := 0x2A9E4A

global scrollPosition := [210, 800]

global upgradeCheck := [800, 740]
global closeBtns := [[1052, 215], [1428, 215]]
global threeUpgrade := [[550, 700], [800, 700], [1050, 700]]
global twoUpgrade := [[675, 700], [925, 700]]

^!r::Reload  ; Ctrl-Alt-R restarts the script

/::  ; "/" displays a pop-up with the mouse position and color
{
  MouseGetPos, xpos, ypos
  PixelGetColor, testedColor, xpos, ypos
  MsgBox, Cursor: X %xpos%, Y %ypos% | Color: %testedColor%
  return
}

k::Upgrade()

Upgrade() {
  MouseMove, scrollPosition[1], scrollPosition[2]
  Send, {WheelUp 10}
  Sleep, 20
  For index, champion in leftChamps {
    TestChamp(champion)
  }
  MouseMove, scrollPosition[1], scrollPosition[2]
  Send, {WheelDown 10}
  Sleep, 20
  For index, champion in rightChamps {
    TestChamp(champion)
  }
}

TestChamp(champion) {
  PixelGetColor, testedColor, champion[1], champion[2]
  If (testedColor = 0x2A9E4A) {
    MouseMove, champion[1], champion[2]
    Click
    Sleep, 20
    PixelGetColor, popupColor, upgradeCheck[1], upgradeCheck[2]
    If (popupColor = 0x171726) {
      MouseMove, closeBtn[1], closeBtn[2]
      Click
      Sleep, 20
    }
  }
}