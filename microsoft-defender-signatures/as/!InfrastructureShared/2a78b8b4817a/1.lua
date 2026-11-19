-- Threat: !InfrastructureShared
-- Name: 2a78b8b4817a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
