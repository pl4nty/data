-- Threat: !InfrastructureShared
-- Name: 8878334f40b0
-- Type: 21

if mp.get_mpattribute("AGGREGATOR:CheckInstalledAV") then
  return mp.INFECTED
end
return mp.CLEAN
