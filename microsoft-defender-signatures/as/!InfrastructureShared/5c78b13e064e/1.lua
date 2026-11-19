-- Threat: !InfrastructureShared
-- Name: 5c78b13e064e
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
