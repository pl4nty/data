-- Threat: !InfrastructureShared
-- Name: 24789de705dc
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
