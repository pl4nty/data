-- Threat: !InfrastructureShared
-- Name: 817898889a45
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
