-- Threat: !InfrastructureShared
-- Name: 40788554f9e9
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
