-- Threat: !InfrastructureShared
-- Name: 7d784f0ca55b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
