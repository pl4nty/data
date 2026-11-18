-- Threat: !InfrastructureShared
-- Name: 22780a08c1fc
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
