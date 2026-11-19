-- Threat: !InfrastructureShared
-- Name: 44786ed6b406
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
