-- Threat: !InfrastructureShared
-- Name: 4b78a69c4de2
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
