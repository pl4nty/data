-- Threat: !InfrastructureShared
-- Name: 127862bf0873
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
