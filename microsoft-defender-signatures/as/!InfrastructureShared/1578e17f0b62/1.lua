-- Threat: !InfrastructureShared
-- Name: 1578e17f0b62
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
