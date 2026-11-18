-- Threat: !InfrastructureShared
-- Name: 9e789eb8c29b
-- Type: 21

if peattributes.isexe and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
