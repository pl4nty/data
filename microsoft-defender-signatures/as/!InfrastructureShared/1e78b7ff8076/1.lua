-- Threat: !InfrastructureShared
-- Name: 1e78b7ff8076
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
