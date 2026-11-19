-- Threat: !InfrastructureShared
-- Name: 10278ba243654
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
