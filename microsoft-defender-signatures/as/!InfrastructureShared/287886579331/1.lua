-- Threat: !InfrastructureShared
-- Name: 287886579331
-- Type: 21

if peattributes.isexe and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
