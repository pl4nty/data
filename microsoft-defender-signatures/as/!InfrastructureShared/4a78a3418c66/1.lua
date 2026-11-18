-- Threat: !InfrastructureShared
-- Name: 4a78a3418c66
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
