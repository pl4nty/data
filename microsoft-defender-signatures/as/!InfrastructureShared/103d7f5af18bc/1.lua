-- Threat: !InfrastructureShared
-- Name: 103d7f5af18bc
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
local l_0_6 = string.find(l_0_2, "amsiscanbuffer", 1, true) or string.find(l_0_2, "amsiinitialize", 1, true) or string.find(l_0_2, "amsi.dll", 1, true)
local l_0_7 = string.find(l_0_2, "etweventwrite", 1, true)
local l_0_8 = string.find(l_0_2, "amsipatch", 1, true) or string.find(l_0_2, "invoke-amsibypass", 1, true) or string.find(l_0_2, "amsiscanbufferptr", 1, true)
local l_0_10 = string.find(l_0_3, "c:\\windows\\system32\\", 1, true) == 1 or string.find(l_0_3, "c:\\windows\\syswow64\\", 1, true) == 1 or string.find(l_0_3, "c:\\program files\\", 1, true) == 1 or string.find(l_0_3, "c:\\program files (x86)\\", 1, true) == 1
local l_0_11 = string.find(l_0_3, "\\temp\\", 1, true) or string.find(l_0_3, "\\downloads\\", 1, true) or string.find(l_0_3, "\\appdata\\", 1, true) or string.find(l_0_3, "\\programdata\\", 1, true) or string.find(l_0_3, "\\users\\public\\", 1, true)
local l_0_13 = l_0_5:sub(-16) == "\\wsmprovhost.exe" or l_0_5:sub(-14) == "\\winrshost.exe" or l_0_5:sub(-13) == "\\psexesvc.exe" or l_0_5:sub(-10) == "\\mshta.exe" or l_0_5:sub(-13) == "\\rundll32.exe" or l_0_5:sub(-13) == "\\regsvr32.exe" or l_0_5:sub(-9) == "\\wmic.exe"
local l_0_14 = string.find(l_0_2, "-encodedcommand", 1, true) or string.find(l_0_2, "frombase64string", 1, true) or string.find(l_0_2, "iex(", 1, true) or string.find(l_0_2, "downloadstring", 1, true) or string.find(l_0_2, " -enc ", 1, true)
if not (l_0_6 or l_0_7 or l_0_8) or not l_0_11 and not l_0_13 and not l_0_14 and not not l_0_10 then
  return mp.CLEAN
end
return mp.INFECTED
