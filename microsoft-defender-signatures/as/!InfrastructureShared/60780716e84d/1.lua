-- Threat: !InfrastructureShared
-- Name: 60780716e84d
-- Type: 21

if peattributes.isexe and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
