-- Threat: !InfrastructureShared
-- Name: 5978d2cfc648
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
