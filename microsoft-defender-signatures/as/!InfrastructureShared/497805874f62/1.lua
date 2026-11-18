-- Threat: !InfrastructureShared
-- Name: 497805874f62
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
