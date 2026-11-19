-- Threat: !InfrastructureShared
-- Name: b578f5ce7687
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
