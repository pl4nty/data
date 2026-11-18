-- Threat: !InfrastructureShared
-- Name: 41780f58de82
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
