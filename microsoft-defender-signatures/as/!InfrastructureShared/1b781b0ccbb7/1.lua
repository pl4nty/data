-- Threat: !InfrastructureShared
-- Name: 1b781b0ccbb7
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
