-- Threat: !InfrastructureShared
-- Name: 7bd7efb75964
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
if l_0_2:match("([^\\]+)$") ~= "explorer.exe" then
  return mp.CLEAN
end
local l_0_3 = mp.GetProcessCommandLine(l_0_0)
if not l_0_3 or #l_0_3 <= 60 then
  return mp.CLEAN
end
if 350 < #l_0_3 then
  return mp.CLEAN
end
return mp.INFECTED
