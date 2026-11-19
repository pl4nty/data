-- Threat: !InfrastructureShared
-- Name: 1e07832b97957
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
