-- Threat: !InfrastructureShared
-- Name: fe61d88e7a3c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
