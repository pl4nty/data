-- Threat: !InfrastructureShared
-- Name: 207888c6950f
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
