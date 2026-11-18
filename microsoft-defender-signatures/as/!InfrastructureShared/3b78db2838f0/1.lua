-- Threat: !InfrastructureShared
-- Name: 3b78db2838f0
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
