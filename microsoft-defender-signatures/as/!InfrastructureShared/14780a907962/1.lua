-- Threat: !InfrastructureShared
-- Name: 14780a907962
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
