-- Threat: !InfrastructureShared
-- Name: 1378c80cf3aa
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
