-- Threat: !InfrastructureShared
-- Name: 31d73e54c79c
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.GetParentProcInfo()
if l_0_1 == nil or l_0_1.image_path == nil then
  return mp.CLEAN
end
local l_0_2 = string.lower(l_0_1.image_path)
if not l_0_2:find("\\explorer.exe") then
  return mp.CLEAN
end
local l_0_3 = mp.GetProcessCommandLine(l_0_0)
if not l_0_3 or #l_0_3 <= 60 then
  return mp.CLEAN
end
if string.find(l_0_3, ".msi", 1, true) == nil then
  return mp.INFECTED
end
return mp.CLEAN
