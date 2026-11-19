-- Threat: !InfrastructureShared
-- Name: 457802a56e70
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
