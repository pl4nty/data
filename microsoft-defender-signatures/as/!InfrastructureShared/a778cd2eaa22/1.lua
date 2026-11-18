-- Threat: !InfrastructureShared
-- Name: a778cd2eaa22
-- Type: 21

if peattributes.isexe and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
