-- Threat: !InfrastructureShared
-- Name: 3e78ac76fb7b
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
