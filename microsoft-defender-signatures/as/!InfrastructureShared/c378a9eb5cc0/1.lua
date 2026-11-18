-- Threat: !InfrastructureShared
-- Name: c378a9eb5cc0
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
