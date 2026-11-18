-- Threat: !InfrastructureShared
-- Name: 6d7813031b52
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
