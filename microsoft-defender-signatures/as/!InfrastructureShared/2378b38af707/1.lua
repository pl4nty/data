-- Threat: !InfrastructureShared
-- Name: 2378b38af707
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
