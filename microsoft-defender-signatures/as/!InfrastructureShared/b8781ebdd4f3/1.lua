-- Threat: !InfrastructureShared
-- Name: b8781ebdd4f3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
