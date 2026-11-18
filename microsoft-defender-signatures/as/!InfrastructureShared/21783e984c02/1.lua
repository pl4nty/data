-- Threat: !InfrastructureShared
-- Name: 21783e984c02
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
