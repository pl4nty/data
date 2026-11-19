-- Threat: !InfrastructureShared
-- Name: 9d786d91c1ca
-- Type: 21

if peattributes.isexe and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
