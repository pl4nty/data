-- Threat: !InfrastructureShared
-- Name: b37837e42040
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
