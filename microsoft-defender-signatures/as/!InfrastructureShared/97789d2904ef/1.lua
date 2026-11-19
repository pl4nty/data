-- Threat: !InfrastructureShared
-- Name: 97789d2904ef
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
