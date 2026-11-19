-- Threat: !InfrastructureShared
-- Name: 2c97889c5e863
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
