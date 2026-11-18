-- Threat: !InfrastructureShared
-- Name: 297848a47189
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
