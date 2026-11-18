-- Threat: !InfrastructureShared
-- Name: 2e78d0424716
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
