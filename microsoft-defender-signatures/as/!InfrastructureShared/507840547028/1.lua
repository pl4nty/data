-- Threat: !InfrastructureShared
-- Name: 507840547028
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
