-- Threat: !InfrastructureShared
-- Name: 577841023dcb
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
