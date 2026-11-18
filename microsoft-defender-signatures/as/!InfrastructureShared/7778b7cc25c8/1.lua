-- Threat: !InfrastructureShared
-- Name: 7778b7cc25c8
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
