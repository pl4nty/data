-- Threat: !InfrastructureShared
-- Name: 4b78a5a46d2a
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
