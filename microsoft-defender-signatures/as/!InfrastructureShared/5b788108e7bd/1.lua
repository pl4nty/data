-- Threat: !InfrastructureShared
-- Name: 5b788108e7bd
-- Type: 21

if mp.get_mpattribute("pea_isexe") and mp.get_mpattribute("HSTR:PossibleVcEpStub") then
  return mp.INFECTED
end
return mp.CLEAN
