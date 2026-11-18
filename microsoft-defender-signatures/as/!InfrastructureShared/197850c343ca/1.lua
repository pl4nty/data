-- Threat: !InfrastructureShared
-- Name: 197850c343ca
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
