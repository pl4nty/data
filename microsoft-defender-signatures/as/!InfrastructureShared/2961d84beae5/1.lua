-- Threat: !InfrastructureShared
-- Name: 2961d84beae5
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
