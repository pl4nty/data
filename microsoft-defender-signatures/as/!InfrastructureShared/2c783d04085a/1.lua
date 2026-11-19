-- Threat: !InfrastructureShared
-- Name: 2c783d04085a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
