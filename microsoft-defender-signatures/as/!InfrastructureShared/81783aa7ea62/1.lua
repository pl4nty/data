-- Threat: !InfrastructureShared
-- Name: 81783aa7ea62
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
