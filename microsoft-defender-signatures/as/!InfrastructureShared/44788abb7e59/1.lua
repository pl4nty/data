-- Threat: !InfrastructureShared
-- Name: 44788abb7e59
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
