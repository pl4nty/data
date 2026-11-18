-- Threat: !InfrastructureShared
-- Name: 6978bd0c4554
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
