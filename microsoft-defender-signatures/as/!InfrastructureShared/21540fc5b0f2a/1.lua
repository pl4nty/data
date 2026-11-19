-- Threat: !InfrastructureShared
-- Name: 21540fc5b0f2a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
