-- Threat: !InfrastructureShared
-- Name: 53d7483dd350
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil or l_0_0.image_path == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.image_path:lower()
local l_0_2 = mp.GetScannedPPID()
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = mp.GetProcessCommandLine(l_0_2):lower()
if not string.find(l_0_1, "\\regsvcs.exe") and string.find(l_0_3, l_0_1, 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
