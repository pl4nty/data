-- Threat: !InfrastructureShared
-- Name: 1a78d0ced32e
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
