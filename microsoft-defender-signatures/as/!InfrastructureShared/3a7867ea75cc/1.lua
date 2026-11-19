-- Threat: !InfrastructureShared
-- Name: 3a7867ea75cc
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
