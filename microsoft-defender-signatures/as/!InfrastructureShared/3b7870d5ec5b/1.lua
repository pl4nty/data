-- Threat: !InfrastructureShared
-- Name: 3b7870d5ec5b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
