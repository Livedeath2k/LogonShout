$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition
Add-Type -AssemblyName System.speech
$Speech1, $Speech2, $Speech3 = 'Hallo Du ', 'Willkommen ', 'Tschüss '
$word = gc $scriptPath\list.txt | sort{get-random} | select -First 1
If ($Art = 1) {$SpeechA = "$Speech1 $Word"}
ElseIf ($Art = 2) {$SpeechA = "$Speech2 $Word"}
ElseIf ($Art = 3) {$SpeechA = "$Speech3 $Word"}
$TalkFM, $TalkAge = "Male", "Adult"
$TalkOut = New-Object System.Speech.Synthesis.SpeechSynthesizer
$TalkOut.SelectVoiceByHints($TalkFM, $TalkAge)
$TalkOut.Rate = "-2"
$TalkOut.Speak("$SpeechA $word")