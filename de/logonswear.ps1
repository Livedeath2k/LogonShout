Add-Type -AssemblyName System.speech
$Speech1, $Speech2, $Speech3 = 'Hallo Du ', 'Willkommen ', 'Tschüss '
$word = gc c:\LogonSwear\liste.txt | sort{get-random} | select -First 1
If ($Art = 1) {$SpeechA = "$Speech1 $Word"}
ElseIf ($Art = 2) {$SpeechA = "$Speech2 $Word"}
ElseIf ($Art = 3) {$SpeechA = "$Speech3 $Word"}
End If
$TalkFM, $TalkAge, $TalkSpeed = VoiceGender Male, VoiceAge Adult, Rate -2
$TalkOut = New-Object System.Speech.Synthesis.SpeechSynthesizer.SelectVoiceByHints($TalkFM, $TalkAge, $TalkSpeed)
PowerShell -Command "$TalkOut.Speak('$SpeechA $wort');"