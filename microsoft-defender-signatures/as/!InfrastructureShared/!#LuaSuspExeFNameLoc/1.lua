-- Threat: !InfrastructureShared
-- Name: !#Lua:SuspExeFNameLoc
-- Type: 9

if not peattributes.isexe then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0)
local l_0_2 = l_0_1:sub(-4)
if l_0_2 ~= ".exe" then
  return mp.CLEAN
end
if l_0_1:find("\\application data\\", 1, true) == nil and l_0_1:find("\\appdata\\", 1, true) == nil and l_0_1:find("\\local\\temp", 1, true) == nil and l_0_1:find("\\local settings\\temp", 1, true) == nil then
  return mp.CLEAN
end
local l_0_3 = pe.get_versioninfo()
if l_0_3 == nil then
  return mp.CLEAN
end
if l_0_3.LegalCopyright == nil then
  return mp.CLEAN
end
if string.find(l_0_3.LegalCopyright, "Microsoft Corp", 1, true) ~= nil or string.find(l_0_3.LegalCopyright, "Citrix Systems", 1, true) ~= nil or string.find(l_0_3.LegalCopyright, "Google Inc", 1, true) ~= nil or string.find(l_0_3.LegalCopyright, "Firefox and Mozilla Developers", 1, true) ~= nil or string.find(l_0_3.LegalCopyright, "Adobe Systems", 1, true) ~= nil or string.find(l_0_3.LegalCopyright, "All Alex", 1, true) ~= nil or string.find(l_0_3.LegalCopyright, "Maple Studio", 1, true) ~= nil or string.find(l_0_3.LegalCopyright, "The Chromium Authors", 1, true) ~= nil then
  return mp.CLEAN
end
local l_0_4 = string.find(l_0_1:reverse(), "\\", 1, true)
if l_0_4 == nil then
  return mp.CLEAN
end
local l_0_5 = #l_0_1 - l_0_4
local l_0_6 = l_0_1:sub(l_0_5 + 2)
local l_0_7 = {
  ["acrord32.exe"] = "",
  ["iexplore.exe"] = "",
  ["firefox.exe"] = "",
  ["chrome.exe"] = ""
}
local l_0_8 = {
  ["explorer.exe"] = "",
  ["hh.exe"] = "",
  ["isuninst.exe"] = "",
  ["notepad.exe"] = "",
  ["regedit.exe"] = "",
  ["slrundll.exe"] = "",
  ["taskman.exe"] = "",
  ["twunk_16.exe"] = "",
  ["twunk_32.exe"] = "",
  ["winhelp.exe"] = "",
  ["winhlp32.exe"] = "",
  ["bfsvc.exe"] = "",
  ["fveupdate.exe"] = "",
  ["helppane.exe"] = "",
  ["write.exe"] = "",
  ["splwow64.exe"] = ""
}
local l_0_9 = {
  ["svchost.exe"] = "",
  ["rundll32.exe"] = "",
  ["explorer.exe"] = "",
  ["reg.exe"] = "",
  ["msiexec.exe"] = "",
  ["dllhost.exe"] = "",
  ["cmd.exe"] = "",
  ["notepad.exe"] = "",
  ["regsvr32.exe"] = "",
  ["userinit.exe"] = "",
  ["wscript.exe"] = "",
  ["regedit.exe"] = "",
  ["secedit.exe"] = "",
  ["calc.exe"] = "",
  ["taskmgr.exe"] = "",
  ["cscript.exe"] = "",
  ["runonce.exe"] = "",
  ["certutil.exe"] = "",
  ["find.exe"] = "",
  ["winver.exe"] = "",
  ["hh.exe"] = "",
  ["write.exe"] = "",
  ["ctfmon.exe"] = "",
  ["gpscript.exe"] = "",
  ["net.exe"] = "",
  ["powercfg.exe"] = "",
  ["lsass.exe"] = "",
  ["tcpsvcs.exe"] = "",
  ["msfeedssync.exe"] = "",
  ["taskeng.exe"] = "",
  ["mshta.exe"] = "",
  ["dllhst3g.exe"] = "",
  ["sdiagnhost.exe"] = "",
  ["werfault.exe"] = "",
  ["sfc.exe"] = "",
  ["upnpcont.exe"] = "",
  ["wiaacmgr.exe"] = "",
  ["mmc.exe"] = "",
  ["mspaint.exe"] = "",
  ["robocopy.exe"] = "",
  ["xcopy.exe"] = "",
  ["logagent.exe"] = "",
  ["wextract.exe"] = "",
  ["cmmon32.exe"] = "",
  ["dpnsvr.exe"] = "",
  ["net1.exe"] = "",
  ["dplaysvr.exe"] = "",
  ["schtasks.exe"] = "",
  ["dvdupgrd.exe"] = "",
  ["fixmapi.exe"] = "",
  ["systray.exe"] = "",
  ["netsh.exe"] = "",
  ["mobsync.exe"] = "",
  ["unregmp2.exe"] = "",
  ["sethc.exe"] = ""
}
if l_0_7[l_0_6] or l_0_8[l_0_6] or l_0_9[l_0_6] then
  local l_0_10 = l_0_1:sub(1, l_0_5)
  if l_0_10 == nil then
    return mp.CLEAN
  end
  if (l_0_10:find("\\application data\\[^\\]+$", 1, false) or l_0_10:find("\\appdata\\roaming\\[^\\]+$", 1, false)) and not l_0_10:find("microsoft", 1, true) and not l_0_10:find("windows", 1, true) and not l_0_10:find("installer", 1, true) and not l_0_10:find("citrix", 1, true) then
    mp.set_mpattribute("Lua:SuspiciousExeLegitNameInAppdata")
  elseif l_0_10:find("\\local\\temp$", 1, false) or l_0_10:find("\\local settings\\temp$", 1, false) then
    mp.set_mpattribute("Lua:SuspiciousExeLegitNameInTemp")
  end
end
return mp.CLEAN
