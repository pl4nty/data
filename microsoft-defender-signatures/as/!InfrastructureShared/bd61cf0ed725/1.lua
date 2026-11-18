-- Threat: !InfrastructureShared
-- Name: bd61cf0ed725
-- Type: 21

if peattributes.isexe and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
