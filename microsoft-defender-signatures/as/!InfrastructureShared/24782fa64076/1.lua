-- Threat: !InfrastructureShared
-- Name: 24782fa64076
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
