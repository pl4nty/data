-- Threat: !InfrastructureShared
-- Name: 5fd71402c8a6
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = string.lower(l_0_1)
local l_0_3 = string.lower(MpCommon.GetImagePathFromPid(l_0_0) or "")
local l_0_4 = mp.GetParentProcInfo()
local l_0_5 = l_0_4 ~= nil and l_0_4.image_path ~= nil and string.lower(l_0_4.image_path) or ""
local l_0_6 = false
local l_0_7 = MpCommon.QuerySessionInformation(l_0_0, MpCommon.WTSUserName)
local l_0_8 = MpCommon.QuerySessionInformation(l_0_0, MpCommon.WTSDomainName)
if l_0_7 ~= nil and l_0_8 ~= nil then
  local l_0_9 = MpCommon.GetUserAccountGroups(l_0_8, l_0_7)
  if l_0_9 ~= nil then
    for l_0_10, l_0_11 in ipairs(l_0_9) do
      if l_0_11 ~= nil and l_0_11.Sid == "S-1-5-32-544" then
        l_0_6 = true
      end
    end
  end
end
local l_0_12 = string.find(l_0_2, "\\\\.\\physicaldrive0", 1, true) or string.find(l_0_2, "\\device\\harddisk0\\dr0", 1, true)
local l_0_14 = l_0_3:sub(-13) == "\\bootsect.exe" or l_0_3:sub(-12) == "\\bcdboot.exe"
local l_0_16 = (string.find(l_0_3, "c:\\windows\\system32\\", 1, true) == 1 or string.find(l_0_3, "c:\\windows\\syswow64\\", 1, true) == 1 or string.find(l_0_3, "c:\\program files\\", 1, true) == 1 or string.find(l_0_3, "c:\\program files (x86)\\", 1, true) == 1) and l_0_6
local l_0_17 = string.find(l_0_3, "\\temp\\", 1, true) or string.find(l_0_3, "\\downloads\\", 1, true) or string.find(l_0_3, "\\appdata\\", 1, true) or string.find(l_0_3, "\\programdata\\", 1, true) or string.find(l_0_3, "\\users\\public\\", 1, true)
local l_0_19 = l_0_5:sub(-16) == "\\wsmprovhost.exe" or l_0_5:sub(-14) == "\\winrshost.exe" or l_0_5:sub(-13) == "\\psexesvc.exe" or l_0_5:sub(-10) == "\\mshta.exe" or l_0_5:sub(-13) == "\\rundll32.exe" or l_0_5:sub(-13) == "\\regsvr32.exe" or l_0_5:sub(-9) == "\\wmic.exe"
local l_0_20 = string.find(l_0_2, "-encodedcommand", 1, true) or string.find(l_0_2, "frombase64string", 1, true) or string.find(l_0_2, "iex(", 1, true) or string.find(l_0_2, "downloadstring", 1, true) or string.find(l_0_2, " -enc ", 1, true)
if not l_0_12 or not l_0_17 and not l_0_19 and not l_0_20 and (l_0_14 or not not l_0_16) then
  return mp.CLEAN
end
return mp.INFECTED
