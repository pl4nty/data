-- Threat: !InfrastructureShared
-- Name: 1e78a728e100
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
