-- Threat: !InfrastructureShared
-- Name: 25d73146c5dc
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = MpCommon.GetImagePathFromPid(l_0_0)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2 = string.match(l_0_1, "\\([^\\]+)$")
if l_0_2 == nil or l_0_2 == "" or l_0_2 ~= "rundll32.exe" then
  return mp.CLEAN
end
local l_0_3 = mp.GetProcessCommandLine(l_0_0)
if l_0_3 == "" or l_0_3 == nil then
  return mp.CLEAN
end
l_0_3 = string.lower(l_0_3)
if l_0_3 == "" or l_0_3 == nil then
  return mp.CLEAN
end
if string.find(l_0_3, "writetotempfile", 1, true) == nil and (string.find(l_0_3, "writetofile", 1, true) == nil or string.find(l_0_3, "\\aiq-", 1, true) == nil) and string.find(l_0_3, "rundll32.dll", 1, true) == nil and string.find(l_0_3, "rundll32_dll", 1, true) == nil and string.find(l_0_3, "injectable_dll", 1, true) == nil and string.find(l_0_3, "attackiqdll", 1, true) == nil then
  local l_0_4 = mp.GetParentProcInfo()
  if l_0_4 == nil then
    return mp.CLEAN
  end
  local l_0_5 = string.lower(l_0_4.image_path)
  if l_0_5 == nil or l_0_5 == "" then
    return mp.CLEAN
  end
  local l_0_6 = string.match(l_0_5, "\\([^\\]+)$")
  if l_0_6 ~= "python.exe" then
    return mp.CLEAN
  end
  local l_0_7 = mp.GetProcessCommandLine(l_0_4.ppid)
  if l_0_7 == nil or l_0_7 == "" then
    return mp.CLEAN
  end
  l_0_7 = string.lower(l_0_7)
  if l_0_7 == nil or l_0_7 == "" then
    return mp.CLEAN
  end
  if string.find(l_0_7, "attack_graph", 1, true) == nil then
    return mp.CLEAN
  end
  if string.find(l_0_7, "comsvcs.dll", 1, true) ~= nil then
    return mp.CLEAN
  end
  if string.find(l_0_7, "minidump", 1, true) ~= nil then
    return mp.CLEAN
  end
  if string.find(l_0_7, "davclnt.dll", 1, true) ~= nil then
    return mp.CLEAN
  end
  if string.find(l_0_7, "davsetcookie", 1, true) ~= nil then
    return mp.CLEAN
  end
end
local l_0_8 = versioning.GetOrgID()
if l_0_8 == nil or l_0_8 == "" then
  return mp.CLEAN
end
return mp.INFECTED
