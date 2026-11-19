-- Threat: !InfrastructureShared
-- Name: 6978ed500f17
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
