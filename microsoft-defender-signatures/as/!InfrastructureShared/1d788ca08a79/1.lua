-- Threat: !InfrastructureShared
-- Name: 1d788ca08a79
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
