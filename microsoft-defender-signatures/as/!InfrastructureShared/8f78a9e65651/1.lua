-- Threat: !InfrastructureShared
-- Name: 8f78a9e65651
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
