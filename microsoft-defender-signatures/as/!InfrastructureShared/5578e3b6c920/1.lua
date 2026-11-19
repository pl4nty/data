-- Threat: !InfrastructureShared
-- Name: 5578e3b6c920
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
