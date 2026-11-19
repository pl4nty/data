-- Threat: !InfrastructureShared
-- Name: 187842a265e2
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
