-- Threat: !InfrastructureShared
-- Name: a27879d89de4
-- Type: 21

if peattributes.isexe and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
