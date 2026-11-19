-- Threat: !InfrastructureShared
-- Name: 169d71feae87f
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = l_0_0.ppid
  if l_0_1 ~= "" and l_0_1 ~= nil then
    TrackPidAndTechnique(l_0_1, "T1505.003", "webshell_parent", 604800)
  end
end
return mp.INFECTED
