-- Threat: !InfrastructureShared
-- Name: 94781498328a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
