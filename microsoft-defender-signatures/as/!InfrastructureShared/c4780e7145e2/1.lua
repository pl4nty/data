-- Threat: !InfrastructureShared
-- Name: c4780e7145e2
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
