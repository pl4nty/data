-- Threat: !InfrastructureShared
-- Name: 54782018e622
-- Type: 21

if peattributes.isexe and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
