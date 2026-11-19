-- Threat: !InfrastructureShared
-- Name: 10d784e0ef3a2
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
