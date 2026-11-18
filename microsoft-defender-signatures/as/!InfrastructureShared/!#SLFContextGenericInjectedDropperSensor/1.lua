-- Threat: !InfrastructureShared
-- Name: !#SLF:ContextGenericInjectedDropperSensor
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & !PEPCODE:HasDigitalSignature

local l_0_0 = mp.getfilesize()
if 1000000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = {
  [".com"] = "",
  [".cpl"] = "",
  [".exe"] = "",
  [".pif"] = "",
  [".scr"] = "",
  [".dll"] = ""
}
local l_0_2 = string.lower(string.sub(mp.getfilename(), -4))
if not l_0_1[l_0_2] then
  return mp.CLEAN
end
local l_0_3 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_3 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  local l_0_4 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
  local l_0_5 = {
    "\\program files\\windowsapps\\",
    "\\program files",
    "\\windowsapps\\",
    "\\filehistory\\",
    "\\windows.old\\",
    "\\grouppolicy\\datastore\\",
    "\\microsoft office\\updates\\download\\packagefiles\\",
    "\\windows\\assembly\\nativeimages",
    "\\microsoft\\windows\\devicesoftwareupdates\\",
    "$windows.~bt\\",
    "\\nvidia\\",
    "\\nvidia corporation\\",
    "\\programs\\python\\",
    "\\lenovo\\",
    "\\windows\\installer\\",
    "\\windows\\system32\\",
    "\\windows\\syswow64\\",
    "\\microsoft\\visualstudio\\",
    "\\drpsu\\programs\\",
    "\\wudownloadcache\\",
    "\\smartsvn\\",
    "\\temp\\_mei",
    "\\hp\\printscout\\"
  }
  for l_0_6, l_0_7 in pairs(l_0_5) do
    if l_0_4:find(l_0_7, 1, true) ~= nil then
      return mp.CLEAN
    end
  end
  local l_0_8 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
  local l_0_9 = "|" .. l_0_8 .. "|"
  local l_0_10 = "|regedit.exe|hh.exe|winhlp32.exe|bfsvc.exe|splwow64.exe|helppane.exe|svchost.exe|reg.exe|dllhost.exe|regsvr32.exe|userinit.exe|secedit.exe|calc.exe|taskmgr.exe|runonce.exe|certutil.exe|find.exe|winver.exe|ctfmon.exe|gpscript.exe|net.exe|powercfg.exe|lsass.exe|tcpsvcs.exe|msfeedssync.exe|taskeng.exe|drvinst.exe|mshta.exe|dllhst3g.exe|sdiagnhost.exe|werfault.exe|sfc.exe|upnpcont.exe|wiaacmgr.exe|mmc.exe|mspaint.exe|logagent.exe|cmmon32.exe|dpnsvr.exe|net1.exe|dplaysvr.exe|schtasks.exe|dvdupgrd.exe|fixmapi.exe|systray.exe|netsh.exe|mobsync.exe|unregmp2.exe|sethc.exe|"
  local l_0_11 = false
  if l_0_10:find(l_0_9, 1, true) then
    if mp.get_mpattribute("BM_MZ_FILE") then
      mp.set_mpattribute("TEL:Lua" .. l_0_8 .. "GenericDropperMZ_FILE")
      l_0_11 = true
    end
    if l_0_11 == true then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
