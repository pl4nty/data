-- Threat: !InfrastructureShared
-- Name: 1ad788815e4f5
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
