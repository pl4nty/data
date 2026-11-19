-- Threat: !InfrastructureShared
-- Name: 9578d7570bd3
-- Type: 21

if peattributes.isexe and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
