-- Threat: !InfrastructureShared
-- Name: 3e787a951c30
-- Type: 21

if peattributes.isexe and peattributes.no_security and peattributes.isvbnative then
  return mp.INFECTED
end
return mp.CLEAN
