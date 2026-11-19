-- Threat: !InfrastructureShared
-- Name: 8378eb12a06c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
