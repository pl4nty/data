-- Threat: !InfrastructureShared
-- Name: 1a78f14c08ea
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
