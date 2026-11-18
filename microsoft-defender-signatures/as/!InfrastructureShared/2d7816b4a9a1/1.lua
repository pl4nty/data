-- Threat: !InfrastructureShared
-- Name: 2d7816b4a9a1
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
