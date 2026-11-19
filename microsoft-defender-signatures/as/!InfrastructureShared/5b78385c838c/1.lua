-- Threat: !InfrastructureShared
-- Name: 5b78385c838c
-- Type: 21

if peattributes.isexe and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
