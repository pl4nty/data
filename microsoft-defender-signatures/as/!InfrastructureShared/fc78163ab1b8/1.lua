-- Threat: !InfrastructureShared
-- Name: fc78163ab1b8
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
