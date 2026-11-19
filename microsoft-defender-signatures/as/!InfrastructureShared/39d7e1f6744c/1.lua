-- Threat: !InfrastructureShared
-- Name: 39d7e1f6744c
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil then
  return mp.CLEAN
end
if string.find(l_0_0.image_path, "/opt/attackiq/agent/", 1, true) then
  return mp.INFECTED
end
local l_0_1 = mp.GetParentProcInfo(l_0_0.ppid)
if l_0_1 == nil then
  return mp.CLEAN
end
if string.find(l_0_1.image_path, "/opt/attackiq/agent/", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
