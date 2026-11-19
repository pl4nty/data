-- Threat: !InfrastructureShared
-- Name: 57784a01c989
-- Type: 21

if not mp.get_mpattribute("RPF:TopLevelFile") or not mp.get_mpattribute("pea_isexe") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename()
if string.find(l_0_0, "ObservationDetectors", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
