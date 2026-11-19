-- Threat: !InfrastructureShared
-- Name: 67e417c11dd94
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
