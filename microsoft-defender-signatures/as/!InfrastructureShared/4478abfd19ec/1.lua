-- Threat: !InfrastructureShared
-- Name: 4478abfd19ec
-- Type: 21

if peattributes.isexe and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
