-- Threat: !InfrastructureShared
-- Name: 18f789304bdc1
-- Type: 21

if peattributes.isexe and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
