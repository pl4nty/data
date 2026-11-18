-- Threat: !InfrastructureShared
-- Name: 9e78ab5b62e0
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
