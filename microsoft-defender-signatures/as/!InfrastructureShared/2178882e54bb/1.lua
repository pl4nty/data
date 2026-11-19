-- Threat: !InfrastructureShared
-- Name: 2178882e54bb
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
