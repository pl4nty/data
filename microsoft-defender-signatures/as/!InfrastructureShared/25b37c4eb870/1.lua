-- Threat: !InfrastructureShared
-- Name: 25b37c4eb870
-- Type: 21

local l_0_0 = {
  "acrord32.exe",
  "iexplore.exe",
  "firefox.exe",
  "chrome.exe"
}
local l_0_1 = {
  "explorer.exe",
  "notepad.exe",
  "regedit.exe",
  "hh.exe",
  "winhlp32.exe",
  "bfsvc.exe",
  "write.exe",
  "splwow64.exe",
  "helppane.exe"
}
local l_0_2 = {
  "svchost.exe",
  "rundll32.exe",
  "explorer.exe",
  "reg.exe",
  "msiexec.exe",
  "dllhost.exe",
  "cmd.exe",
  "notepad.exe",
  "regsvr32.exe",
  "userinit.exe",
  "wscript.exe",
  "regedit.exe",
  "secedit.exe",
  "calc.exe",
  "taskmgr.exe",
  "cscript.exe",
  "runonce.exe",
  "certutil.exe",
  "find.exe",
  "winver.exe",
  "hh.exe",
  "write.exe",
  "ctfmon.exe",
  "gpscript.exe",
  "net.exe",
  "powercfg.exe",
  "lsass.exe",
  "tcpsvcs.exe",
  "msfeedssync.exe",
  "taskeng.exe",
  "drvinst.exe",
  "mshta.exe",
  "dllhst3g.exe",
  "sdiagnhost.exe",
  "werfault.exe",
  "sfc.exe",
  "upnpcont.exe",
  "wiaacmgr.exe",
  "mmc.exe",
  "mspaint.exe",
  "robocopy.exe",
  "xcopy.exe",
  "logagent.exe",
  "wextract.exe",
  "cmmon32.exe",
  "dpnsvr.exe",
  "net1.exe",
  "dplaysvr.exe",
  "schtasks.exe",
  "dvdupgrd.exe",
  "fixmapi.exe",
  "systray.exe",
  "netsh.exe",
  "mobsync.exe",
  "unregmp2.exe",
  "sethc.exe"
}
local l_0_3 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
local l_0_4 = l_0_3:match("(%w+%.exe)$")
if l_0_4 == nil then
  return mp.CLEAN
end
local l_0_5 = string.lower(MpCommon.ExpandEnvironmentVariables("%WINDIR%"))
local l_0_6 = string.lower(MpCommon.ExpandEnvironmentVariables("%PROGRAMFILES%"))
local l_0_7 = string.lower(MpCommon.ExpandEnvironmentVariables("%PROGRAMFILES(86)%"))
if l_0_6 ~= nil and l_0_3:find(l_0_6) or l_0_7 ~= nil and l_0_3:find(l_0_7) then
  for l_0_8, l_0_9 in pairs(l_0_0) do
    if l_0_9 == l_0_4 then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end
if l_0_5 ~= nil then
  if l_0_3:find(l_0_5 .. "\\system32") or l_0_3:find(l_0_5 .. "\\syswow64") then
    for l_0_10, l_0_11 in pairs(l_0_2) do
      if l_0_11 == l_0_4 then
        return mp.INFECTED
      end
    end
    return mp.CLEAN
  elseif l_0_3:find(l_0_5) then
    for l_0_12, l_0_13 in pairs(l_0_1) do
      if l_0_13 == l_0_4 then
        return mp.INFECTED
      end
    end
    return mp.CLEAN
  end
end
return mp.CLEAN
