-- Threat: !InfrastructureShared
-- Name: 3678cbfd9424
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
