-- Threat: !InfrastructureShared
-- Name: 5e786ae1dfb3
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
