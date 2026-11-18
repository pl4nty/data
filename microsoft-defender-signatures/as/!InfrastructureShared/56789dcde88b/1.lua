-- Threat: !InfrastructureShared
-- Name: 56789dcde88b
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
