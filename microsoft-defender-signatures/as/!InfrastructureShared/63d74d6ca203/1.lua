-- Threat: !InfrastructureShared
-- Name: 63d74d6ca203
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil then
  return mp.CLEAN
end
if l_0_0.ppid == nil then
  return mp.CLEAN
end
TrackPidAndTechnique(l_0_0.ppid, "T1040", "Network_Sniffing_cmd")
local l_0_1 = GetTacticsTableForPid(l_0_0.ppid)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = 0
for l_0_3, l_0_4 in pairs(l_0_1) do
  if string.find(l_0_3, "mt2023", 1, true) then
    l_0_2 = l_0_2 + 1
  end
end
if 2 < l_0_2 then
  return mp.INFECTED
end
return mp.CLEAN
