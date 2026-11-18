-- Threat: !InfrastructureShared
-- Name: 917873d854a5
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
