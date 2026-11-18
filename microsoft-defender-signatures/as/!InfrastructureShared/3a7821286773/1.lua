-- Threat: !InfrastructureShared
-- Name: 3a7821286773
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
