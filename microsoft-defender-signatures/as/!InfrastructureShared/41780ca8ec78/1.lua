-- Threat: !InfrastructureShared
-- Name: 41780ca8ec78
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
