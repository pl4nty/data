-- Threat: !InfrastructureShared
-- Name: 197864319d68
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
