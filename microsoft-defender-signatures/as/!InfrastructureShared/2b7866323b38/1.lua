-- Threat: !InfrastructureShared
-- Name: 2b7866323b38
-- Type: 21

if peattributes.isexe and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
