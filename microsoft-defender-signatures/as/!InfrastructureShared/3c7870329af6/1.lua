-- Threat: !InfrastructureShared
-- Name: 3c7870329af6
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
