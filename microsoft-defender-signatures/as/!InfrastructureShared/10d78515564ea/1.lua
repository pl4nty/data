-- Threat: !InfrastructureShared
-- Name: 10d78515564ea
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
