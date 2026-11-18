-- Threat: !InfrastructureShared
-- Name: 35789ada5bf3
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
