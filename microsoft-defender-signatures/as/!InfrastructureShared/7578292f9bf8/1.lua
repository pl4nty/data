-- Threat: !InfrastructureShared
-- Name: 7578292f9bf8
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
