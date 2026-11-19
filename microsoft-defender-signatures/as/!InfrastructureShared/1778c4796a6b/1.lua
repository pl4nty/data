-- Threat: !InfrastructureShared
-- Name: 1778c4796a6b
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
