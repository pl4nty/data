-- Threat: !InfrastructureShared
-- Name: 2a7889b2015b
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
