-- Threat: !InfrastructureShared
-- Name: 407836abb0d7
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
