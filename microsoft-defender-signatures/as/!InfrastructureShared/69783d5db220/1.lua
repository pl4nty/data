-- Threat: !InfrastructureShared
-- Name: 69783d5db220
-- Type: 21

if peattributes.no_security and peattributes.isexe and peattributes.isvbnative then
  return mp.INFECTED
end
return mp.CLEAN
