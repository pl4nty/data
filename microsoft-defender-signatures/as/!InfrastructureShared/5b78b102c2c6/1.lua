-- Threat: !InfrastructureShared
-- Name: 5b78b102c2c6
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
