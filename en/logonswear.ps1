[CmdletBinding()]
Param(
  [Parameter(Mandatory=$true)]
   [String]$type,
	
   [Parameter(Mandatory=$true)]
   [String]$greeting
)

Add-Type -AssemblyName System.speech
# Declarations of variables
# At first it recognises the current path
$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition
# Different greetings as variables
$Speech1, $Speech2, $Speech3 = "Welcome", "Welcome back", "Good bye"
# Select the voice type
$TalkFM, $TalkAge = 'Male', 'Adult'

switch($type){
Swear {$word = gc $scriptPath\list-swear.txt | sort{get-random} | select -First 1}
Praise {$word = gc $scriptPath\list-praise.txt | sort{get-random} | select -First 1}
}

switch($greeting){
Login {$SpeechOut = "$Speech2 $Word"}
Logon {$SpeechOut = "$Speech1 $Word"}
Logout {$SpeechOut = "$Speech3 $Word"}
}

$TalkOut = New-Object System.Speech.Synthesis.SpeechSynthesizer
$TalkOut.SelectVoiceByHints($TalkFM, $TalkAge)
$TalkOut.Rate = "-2"
$TalkOut.Speak("$SpeechOut")