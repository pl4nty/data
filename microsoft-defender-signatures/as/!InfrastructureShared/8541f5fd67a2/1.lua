-- Threat: !InfrastructureShared
-- Name: 8541f5fd67a2
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
