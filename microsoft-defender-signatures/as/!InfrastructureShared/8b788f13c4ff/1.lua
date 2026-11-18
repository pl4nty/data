-- Threat: !InfrastructureShared
-- Name: 8b788f13c4ff
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
