-- Threat: !InfrastructureShared
-- Name: 9978f2d911d8
-- Type: 21

if peattributes.isexe and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
