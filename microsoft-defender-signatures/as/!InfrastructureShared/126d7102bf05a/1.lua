-- Threat: !InfrastructureShared
-- Name: 126d7102bf05a
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
if IsTechniqueObservedForParents(l_0_0, "T1047", 2) or IsTechniqueObservedForParents(l_0_0, "T1021.006", 2) then
  return mp.INFECTED
end
return mp.LOWFI
