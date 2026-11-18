-- Threat: !InfrastructureShared
-- Name: 55401ad1a8af
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
