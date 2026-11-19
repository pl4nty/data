-- Threat: !InfrastructureShared
-- Name: 8629d4ce282a
-- Type: 21

if mp.get_mpattribute("ExcelSiorType.D") then
  return mp.INFECTED
end
return mp.CLEAN
