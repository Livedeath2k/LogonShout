@if (@CodeSection == @Batch) @then

@echo off
setlocal

set "search=Test"
set "replace=-executionpolicy bypass -File %~dp0logonswear.ps1 -Type swear -Art login"

for %%I in (logonswear.xml) do (
    rem // invoke JScript for each XML file
    cscript /nologo /e:JScript "%~f0" "%%~I" "%search%" "%replace%"
)

SchTasks /Create /XML %~dp0logonswear.xml /TN "LogonSwear - Login"
SchTasks /Create /SC ONLOGON /TN "LogonSwear - Logon" /TR "powershell.exe -executionpolicy bypass -File %~dp0logonswear.ps1 -Type swear -Art logon"
SchTasks /Create /SC ONEVENT /MO "*[System[Provider[@Name='Microsoft-Windows-Security-Auditing'] and EventID=4647]]" /EC Security /TN "LogonSwear - Logout" /TR "powershell.exe -executionpolicy bypass -File %~dp0logonswear.ps1 -Type swear -Art logout"

goto :EOF
@end // end batch / begin JScript chimera

var DOM = WSH.CreateObject('Microsoft.XMLDOM'),
    args = { file: WSH.Arguments(0), search: WSH.Arguments(1), repl: WSH.Arguments(2) },
    XPath = "//text()[contains(.,'" + args.search + "')]";

DOM.load(args.file);
DOM.async = false;
DOM.setProperty('SelectionLanguage', 'XPath');

if (DOM.parseError.errorCode) {
    var e = DOM.parseError;
    WSH.StdErr.WriteLine('Error in ' + args.file + ' line ' + e.line + ' char '
        + e.linepos + ':\n' + e.reason + '\n' + e.srcText);
    WSH.Quit(1);
}

for (var d = DOM.selectNodes(XPath), i = 0; i < d.length; i++)
    d[i].nodeValue = args.repl;

DOM.save(args.file);