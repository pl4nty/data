-- Threat: !InfrastructureShared
-- Name: ab78db549e74
-- Type: 21

if peattributes.isexe and peattributes.no_security and peattributes.isvbnative then
  return mp.INFECTED
end
return mp.CLEAN
