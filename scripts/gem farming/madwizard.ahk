#SingleInstance, force

global grandTourBtn := [110, 130]
global tombBtn := [110, 200]
global campaignMap := [800, 500]
global madWizard := [560, 500]
global startObjective := [966, 675]

global transitionTest := [105, 910]

global fam1 := [1254, 428]
global fam2 := [1254, 512]
global fam3 := [1171, 594]
global fam4 := [1088, 512]
global fam5 := [1088, 428]
global fam6 := [185, 890]
global familiars := [fam1, fam2, fam3, fam4, fam5, fam6]

global celeste := [465, 900]
global nayeli := [605, 900]
global jarlaxle := [745, 900]
global calliope := [885, 900]
global asharra := [1025, 900]
global champions := [celeste, nayeli, jarlaxle, calliope, asharra]

global completeAdventure := [724, 610]
global resetContinue := [800, 760]

^!r::Reload  ; Ctrl-Alt-R restarts the script

^+r::  ; Ctrl-Shift-R displays a pop-up with the mouse position
{
  MouseGetPos, xpos, ypos
  MsgBox, The cursor is at X %xpos%, Y %ypos%
  return
}

/::PlaceFamiliars()
^b::StartCampaign()
^n::EndCampaign()

^g::StartGemFarm()

StartGemFarm() {
  Loop {
    StartCampaign()
    PlaceFamiliars()
    RecruitChampions()
    Loop, 30
    {
      WaitForTransition()
    }
    EndCampaign()
  }
}

StartCampaign() {
  Send, {WheelUp 10}
  Sleep, 100
  MouseMove, tombBtn[1], tombBtn[2]
  Click
  Sleep, 100
  MouseMove, grandTourBtn[1], grandTourBtn[2]
  Click
  Sleep, 100
  MouseMove, campaignMap[1], campaignMap[2]
  Click
  Sleep, 700
  MouseMove, madWizard[1], madWizard[2]
  Send, {WheelUp 10}
  Sleep, 100
  Click
  Sleep, 100
  MouseMove, startObjective[1], startObjective[2]
  Click
  Sleep, 5000
}

PlaceFamiliars() {
  Send, {f down}
  For index, familiar in familiars {
    Sleep 100
    MouseMove, familiar[1], familiar[2]
    Click
  }
  Send, {f up}
  Sleep, 100
}

WaitForTransition() {
  transitioning := False
  while !transitioning
  {
    PixelGetColor, testedColor, transitionTest[1], transitionTest[2]
    if (testedColor = 0x000000)
      transitioning = True
    Sleep, 100
  }
  Sleep, 2000
}

RecruitChampions() {
  Sleep, 5000
  For index, champion in champions {
    Sleep 100
    MouseMove, champion[1], champion[2]
    Click
  }
}

EndCampaign() {
  Send, {r Down}{r Up}
  Sleep, 700
  MouseMove, completeAdventure[1], completeAdventure[2]
  Click
  Sleep, 16000
  MouseMove, resetContinue[1], resetContinue[2]
  Click
  Sleep, 2000
}