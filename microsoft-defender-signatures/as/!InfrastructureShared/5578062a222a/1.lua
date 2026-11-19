-- Threat: !InfrastructureShared
-- Name: 5578062a222a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
