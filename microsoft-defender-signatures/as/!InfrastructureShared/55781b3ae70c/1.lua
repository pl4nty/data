-- Threat: !InfrastructureShared
-- Name: 55781b3ae70c
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
