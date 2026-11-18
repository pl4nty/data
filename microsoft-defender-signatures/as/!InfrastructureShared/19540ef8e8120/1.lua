-- Threat: !InfrastructureShared
-- Name: 19540ef8e8120
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
