-- Threat: !InfrastructureShared
-- Name: 55b34c29aef0
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
local l_0_1 = l_0_0 and string.lower(l_0_0.image_path or "") or ""
local l_0_2 = l_0_0 and l_0_0.ppid and string.lower(mp.GetProcessCommandLine(l_0_0.ppid) or "") or ""
if string.find(l_0_1, "python", 1, true) ~= nil and (string.find(l_0_2, "edr_complete_stress_workload", 1, true) ~= nil or string.find(l_0_2, "edr_event_gen", 1, true) ~= nil or string.find(l_0_2, "capture.py --seconds", 1, true) ~= nil or string.find(l_0_2, "campaign.py campaign", 1, true) ~= nil) then
  return mp.CLEAN
end
return mp.INFECTED
