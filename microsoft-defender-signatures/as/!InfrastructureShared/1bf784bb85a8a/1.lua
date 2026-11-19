-- Threat: !InfrastructureShared
-- Name: 1bf784bb85a8a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
