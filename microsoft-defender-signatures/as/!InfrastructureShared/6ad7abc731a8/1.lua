-- Threat: !InfrastructureShared
-- Name: 6ad7abc731a8
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetParentProcInfo()
if l_0_1 == nil or l_0_1.image_path == nil then
  return mp.CLEAN
end
local l_0_2 = string.lower(l_0_1.image_path)
if l_0_2:match("([^\\]+)$") ~= "svchost.exe" then
  return mp.CLEAN
end
local l_0_3 = mp.GetProcessCommandLine(l_0_1.ppid)
if not l_0_3 or #l_0_3 <= 40 then
  return mp.CLEAN
end
l_0_3 = string.lower(l_0_3)
if contains(l_0_3, {"netsvcs"}) and contains(l_0_3, {
  "-s schedule"
}) then
  return mp.INFECTED
end
return mp.CLEAN
