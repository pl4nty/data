-- Threat: !InfrastructureShared
-- Name: 11e78efcbb3c7
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
