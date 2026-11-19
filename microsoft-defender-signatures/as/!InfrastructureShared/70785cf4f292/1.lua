-- Threat: !InfrastructureShared
-- Name: 70785cf4f292
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
