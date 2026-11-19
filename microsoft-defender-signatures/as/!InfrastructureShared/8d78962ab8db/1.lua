-- Threat: !InfrastructureShared
-- Name: 8d78962ab8db
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
