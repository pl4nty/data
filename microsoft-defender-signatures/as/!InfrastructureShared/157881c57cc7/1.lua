-- Threat: !InfrastructureShared
-- Name: 157881c57cc7
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
