-- Threat: !InfrastructureShared
-- Name: d54082f1d6aa
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
