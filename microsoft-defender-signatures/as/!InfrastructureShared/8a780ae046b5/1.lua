-- Threat: !InfrastructureShared
-- Name: 8a780ae046b5
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
