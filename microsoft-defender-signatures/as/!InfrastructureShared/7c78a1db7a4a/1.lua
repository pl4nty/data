-- Threat: !InfrastructureShared
-- Name: 7c78a1db7a4a
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
