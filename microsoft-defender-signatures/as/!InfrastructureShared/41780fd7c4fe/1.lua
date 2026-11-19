-- Threat: !InfrastructureShared
-- Name: 41780fd7c4fe
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
