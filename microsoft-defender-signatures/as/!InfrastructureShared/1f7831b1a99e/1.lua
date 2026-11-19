-- Threat: !InfrastructureShared
-- Name: 1f7831b1a99e
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
