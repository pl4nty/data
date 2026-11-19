-- Threat: !InfrastructureShared
-- Name: 497857158ebb
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
