-- Threat: !InfrastructureShared
-- Name: 757891c27318
-- Type: 21

if peattributes.isexe and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
