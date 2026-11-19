-- Threat: !InfrastructureShared
-- Name: 8278a8a430b7
-- Type: 21

if peattributes.isexe and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
