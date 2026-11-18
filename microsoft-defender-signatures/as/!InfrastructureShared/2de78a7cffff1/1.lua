-- Threat: !InfrastructureShared
-- Name: 2de78a7cffff1
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
