-- Threat: !InfrastructureShared
-- Name: 8c78df9f0d93
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
