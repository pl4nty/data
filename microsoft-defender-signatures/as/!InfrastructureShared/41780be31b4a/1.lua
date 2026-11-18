-- Threat: !InfrastructureShared
-- Name: 41780be31b4a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
