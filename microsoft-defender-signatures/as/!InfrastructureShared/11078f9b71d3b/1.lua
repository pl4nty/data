-- Threat: !InfrastructureShared
-- Name: 11078f9b71d3b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
