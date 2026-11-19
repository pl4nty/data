-- Threat: !InfrastructureShared
-- Name: 19f61159ec07f
-- Type: 21

if peattributes.isexe and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
