-- Threat: !InfrastructureShared
-- Name: dc783320f948
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
