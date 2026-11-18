-- Threat: !InfrastructureShared
-- Name: 5678ca551aad
-- Type: 21

if peattributes.isexe and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
