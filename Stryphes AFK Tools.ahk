#Requires AutoHotkey v2.0

Options := "+MaximizeBox +MinimizeBox +Resize +AlwaysOnTop"

state := Object()

state.clicker := 0
state.mover := 0

mainGui := Gui(Options, "Styphe's AFK Tools", )

mainGui.Add("Text",, "Welcome to Stryphe's AFK Tools!")

; add button to start auto clicking every 200 ms
clickCheckBox := mainGui.AddCheckBox( "vClickCheckBox", "Toggle Clicker")

clickCheckBox.OnEvent("Click", clickCheckBox_Click)


clickCheckBox_Click(thisCheckBox, Info){

    If(thisCheckBox.Value = 1){
        ToggleClick()
    }
}

vClickCheckBox_Click(thisCheckBox){
    ToggleClick()
}

; mainGui["vClickCheckBox"].OnEvent("Click", ToggleClick)

; ; add button to stop auto clicking
; mainGui.Add("Button", "Default", "Stop Clicker").OnEvent("Click", StopAutoClick)

mainGui.Show()

Return

StopAutoClick(*){
    ClickIsOn := 0
}

ToggleClick(){

    state.clicker := !state.clicker

    While clickCheckBox.Value = 1
    {
        ; state.gui.clickButton.BackColor := "Red"
        Sleep(1000 * Random(.25, 1))
        MouseClick( "left" , , , , , ,)

        ; TestGUI := Gui("+Resize minsize480x240", "Test",)
        ; TestGUI.Show()
    }
}

; While True{
;     If( GetKeyState("CapsLock", "T") = 1 )
;     {
;         ToggleClick()
;     }
; }