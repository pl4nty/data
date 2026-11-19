-- Threat: !InfrastructureShared
-- Name: 9a784d2ffe39
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
