-- Threat: !InfrastructureShared
-- Name: bf78a132f168
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
