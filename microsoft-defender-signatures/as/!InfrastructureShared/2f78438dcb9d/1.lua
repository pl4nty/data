-- Threat: !InfrastructureShared
-- Name: 2f78438dcb9d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
