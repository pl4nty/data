-- Threat: !InfrastructureShared
-- Name: 74781fd092c6
-- Type: 21

if peattributes.isexe and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
