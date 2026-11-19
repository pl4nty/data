-- Threat: !InfrastructureShared
-- Name: 2c7828abf9e5
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
