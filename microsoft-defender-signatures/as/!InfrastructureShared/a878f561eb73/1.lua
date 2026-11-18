-- Threat: !InfrastructureShared
-- Name: a878f561eb73
-- Type: 21

if peattributes.isexe and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
