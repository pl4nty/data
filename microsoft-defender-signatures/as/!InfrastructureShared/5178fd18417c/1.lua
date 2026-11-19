-- Threat: !InfrastructureShared
-- Name: 5178fd18417c
-- Type: 21

if peattributes.isexe and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
