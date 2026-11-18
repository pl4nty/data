-- Threat: !InfrastructureShared
-- Name: 2f781ca92e29
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
